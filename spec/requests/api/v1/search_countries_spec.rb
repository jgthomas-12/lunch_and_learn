require "rails_helper"

RSpec.describe "API V1 Recipes request", type: :request do
  describe "GET /api/v1/recipes" do
    describe "happy path" do

      it "returns a list of recipes from a specified country", :vcr do

        get '/api/v1/recipes', params: { country: 'thailand' }, headers: { 'Accept' => 'application/json' }

        recipes = JSON.parse(response.body, symbolize_names: true)

        recipes[:data].each do |recipe|
          expect(recipe).to have_key(:id)
          expect(recipe[:id]).to be_a(String)
          expect(recipe[:id]).to eq("null")

          expect(recipe).to have_key(:type)
          expect(recipe[:type]).to be_a(String)
          expect(recipe[:type]).to eq("recipe")

          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes]).to have_key(:country)
          expect(recipe[:attributes]).to have_key(:image_url)

          expect(recipe[:attributes][:title]).to be_a(String)
          expect(recipe[:attributes][:url]).to be_a(String)
          expect(recipe[:attributes][:country]).to be_a(String)
          expect(recipe[:attributes][:image_url]).to be_a(String)

          expect(recipe[:attributes]).to_not have_key(:yield)
          expect(recipe[:attributes]).to_not have_key(:dietLabels)
          expect(recipe[:attributes]).to_not have_key(:heathLabels)
        end
      end

      it "returns a list of recipes from a random country if no country is specified", :vcr do

        get '/api/v1/recipes', params: { country: "random" }, headers: { 'Accept' => 'application/json' }

        recipes = JSON.parse(response.body, symbolize_names: true)

        recipes[:data].each do |recipe|
          expect(recipe).to have_key(:id)
          expect(recipe[:id]).to be_a(String)
          expect(recipe[:id]).to eq("null")

          expect(recipe).to have_key(:type)
          expect(recipe[:type]).to be_a(String)
          expect(recipe[:type]).to eq("recipe")

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

    describe "sad path" do
      it "returns an emptry array if parameter is emptry string or value does't return any recipes", :vcr do

        get '/api/v1/recipes', params: { country: 'dsf34' }, headers: { 'Accept' => 'application/json' }

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq({ "data" => [] })
      end
    end
  end
end
