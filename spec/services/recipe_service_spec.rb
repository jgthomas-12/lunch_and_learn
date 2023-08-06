require "rails_helper"

RSpec.describe "Recipe Service" do
  it "can get a list of recipes from a specified country" do
    thai_response = File.read("spec/fixtures/thailand_recipes.json")
    stub_request(:get, "https://api.edamam.com/recipes/v2/?app_id=043cfb46&app_key=e34840b26bcec722562c1fbb2d1d6e43&q=thailand&type=public")
    .to_return(status: 200, body: thai_response)

    thai_recipes = RecipeService.new.get_all_recipes("thailand")
    naam = thai_recipes[:hits].first

    expect(thai_recipes).to be_a(Hash)
    expect(thai_recipes).to have_key(:hits)
    expect(thai_recipes[:hits]).to be_an(Array)

    expect(naam[:recipe]).to have_key(:label)
    expect(naam[:recipe][:label]).to be_a(String)

    expect(naam[:recipe]).to have_key(:url)
    expect(naam[:recipe][:url]).to be_a(String)

    expect(naam[:recipe]).to have_key(:image)
    expect(naam[:recipe][:image]).to be_a(String)
  end
end