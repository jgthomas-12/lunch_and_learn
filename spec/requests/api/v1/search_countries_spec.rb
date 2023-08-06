require "rails_helper"

RSpec.describe "API V1 Recipes request", type: :request do
  describe "GET /api/v1/recipes" do
    it "returns a list of recipes from a specified country" do
      thai_response = File.read("spec/fixtures/thailand_recipes.json")
      stub_request(:get, "https://api.edamam.com/recipes/v2/?app_id=043cfb46&app_key=e34840b26bcec722562c1fbb2d1d6e43&q=thailand&type=public")
      .to_return(status: 200, body: thai_response)

      # get '/api/v1/recipes', params: { country: 'thailand' }, headers: { 'Accept' => 'application/json' }

      get "/api/v1/recipes?country=thailand"

      # recipes = JSON.parse(response.body, symbolize_names: true)
    end
  end
end