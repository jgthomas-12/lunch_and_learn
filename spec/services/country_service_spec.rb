require "rails_helper"

RSpec.describe "Country Service" do
  it "can get a list of recipes from a random country" do
    countries = File.read("spec/fixtures/all_countries.json")
    stub_request(:get, "https://restcountries.com/v3.1/all")
    .to_return(status: 200, body: countries)

    recipes = File.read("spec/fixtures/thailand_recipes.json")
    stub_request(:get, "https://api.edamam.com/recipes/v2/?app_id=043cfb46&app_key=e34840b26bcec722562c1fbb2d1d6e43&q=&type=public")
        .to_return(status: 200, body: recipes)

    thai_recipes = File.read("spec/fixtures/thailand_recipes.json")
    stub_request(:get, "https://api.edamam.com/recipes/v2/?app_id=043cfb46&app_key=e34840b26bcec722562c1fbb2d1d6e43&q=thailand&type=public")
      .to_return(status: 200, body: recipes)

      service = CountryService.new
      random_country = service.get_random_country

      expect(random_country).to be_a(Hash)
      expect(random_country[:name]).to be_a(Hash)
      expect(random_country[:name]).to have_key(:common)
      expect(random_country[:name][:common]).to be_a(String)
  end
end