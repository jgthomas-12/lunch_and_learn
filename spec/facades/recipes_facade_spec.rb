require "rails_helper"

RSpec.describe RecipesFacade do
  describe "#get_recipes" do
    it "gets a list of all recipes for a specific country" do
      thai_response = File.read("spec/fixtures/thailand_recipes.json")
      stub_request(:get, "https://api.edamam.com/recipes/v2/?app_id=043cfb46&app_key=e34840b26bcec722562c1fbb2d1d6e43&q=thailand&type=public")
      .to_return(status: 200, body: thai_response)

      thai_recipes = RecipesFacade.new.get_recipes("thailand")
      expect(thai_recipes).to be_an(Array)
      expect(thai_recipes.first).to be_a(Recipe)
    end
  end
end
