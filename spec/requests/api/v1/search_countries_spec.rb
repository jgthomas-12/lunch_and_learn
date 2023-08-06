require "rails_helper"

RSpec.describe "API V1 Recipes request", type: :request do
  describe "GET /api/v1/recipes" do
    it "returns a list of recipes from a specified country" do
      thai_response = File.read("spec/fixtures/thailand_recipes.json")
      stub_request(:get, "https://api.edamam.com/recipes/v2/?app_id=043cfb46&app_key=e34840b26bcec722562c1fbb2d1d6e43&q=thailand&type=public")
      .to_return(status: 200, body: thai_response)

      get '/api/v1/recipes', params: { country: 'thailand' }, headers: { 'Accept' => 'application/json' }

      # get "/api/v1/recipes?country=thailand"

      recipes = JSON.parse(response.body, symbolize_names: true)

      recipes[:data].each do |recipe|
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to be_a(String)
        expect(recipe[:id]).to eq("null")

        expect(recipe).to have_key(:type)
        expect(recipe[:type]).to be_a(String)
        expect(recipe[:type]).to eq("recipe")

        expect(recipe[:attributes]).to have_key(:id)
        expect(recipe[:attributes][:id]).to be_a(String)
        expect(recipe[:attributes][:id]).to eq("null")

        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes]).to have_key(:image_url)

        expect(recipe[:attributes][:title]).to be_a(String)
        expect(recipe[:attributes][:url]).to be_a(String)
        expect(recipe[:attributes][:country]).to be_a(String)
        expect(recipe[:attributes][:image_url]).to be_a(String)
      end
    end
  end
end