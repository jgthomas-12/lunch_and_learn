require "rails_helper"

RSpec.describe "API V1 Recipes request", type: :request do
  describe "GET /api/v1/recipes" do
    describe "happy path" do

      it "returns a list of recipes from a specified country", :vcr do
        # thai_response = File.read("spec/fixtures/thailand_recipes.json")
        # stub_request(:get, "https://api.edamam.com/recipes/v2/?app_id=043cfb46&app_key=e34840b26bcec722562c1fbb2d1d6e43&q=thailand&type=public")
        # .to_return(status: 200, body: thai_response)

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
        # countries = File.read("spec/fixtures/all_countries.json")
        # stub_request(:get, "https://restcountries.com/v3.1/all")
        # .to_return(status: 200, body: countries)

        # recipes = File.read("spec/fixtures/thailand_recipes.json")
        # stub_request(:get, "https://api.edamam.com/recipes/v2/?app_id=043cfb46&app_key=e34840b26bcec722562c1fbb2d1d6e43&q=&type=public")
        # .to_return(status: 200, body: recipes)

        # thai_recipes = File.read("spec/fixtures/thailand_recipes.json")
        # stub_request(:get, "https://api.edamam.com/recipes/v2/?app_id=043cfb46&app_key=e34840b26bcec722562c1fbb2d1d6e43&q=thailand&type=public")
        # .to_return(status: 200, body: recipes)

        data = {
          name: {
            common: "thailand"
          }
        }

        thailand = Country.new(data)
        allow_any_instance_of(CountriesFacade).to receive(:get_country).and_return(thailand)

        get '/api/v1/recipes', params: { country: '' }, headers: { 'Accept' => 'application/json' }

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
        # countries = File.read("spec/fixtures/empty_array.json")
        # stub_request(:get, "https://api.edamam.com/recipes/v2/?app_id=043cfb46&app_key=e34840b26bcec722562c1fbb2d1d6e43&q=dsf34&type=public")
        # .to_return(status: 200, body: countries)

        get '/api/v1/recipes', params: { country: 'dsf34' }, headers: { 'Accept' => 'application/json' }

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq({ "data" => [] })
      end
    end

    # describe '' do
    #   it '', :vcr do
    #     country = CountriesFacade.new.get_capital("thailand")

    #     require 'pry'; binding.pry
    #   end
    # end


  end
end
