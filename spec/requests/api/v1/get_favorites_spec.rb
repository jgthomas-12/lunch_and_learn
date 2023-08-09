require "rails_helper"

RSpec.describe "GET /api/v1/favorites", type: :request do
  describe "GET /api/v1/favorites" do
    describe "happy path" do
      it "gets a list of the users favorites" do
        @joey = User.create!(name: "Joey", email: "joeydoesgood@gmailjoey.com", password: "Joey", password_confirmation: "Joey")
        favorite_1 = @joey.favorites.create(recipe_title: "Something fancy", recipe_link: "https://www.example.com/fancyshit", country: "Malaysia" )
        favorite_2 = @joey.favorites.create(recipe_title: "Something fancier", recipe_link: "https://www.example.com/fanciershit", country: "Philippines" )

        get "/api/v1/favorites", params: { api_key: @joey.api_key }

        expect(response).to be_successful
        expect(response.status).to eq(200)

        favorites = JSON.parse(response.body, symbolize_names: true)
        expect(favorites).to be_a(Hash)
        expect(favorites).to have_key(:data)
        expect(favorites[:data]).to be_an(Array)
        expect(favorites[:data].length).to eq(2)

        expect(favorites[:data][0]).to have_key(:id)
        expect(favorites[:data][0]).to have_key(:type)
        expect(favorites[:data][0]).to have_key(:attributes)

        expect(favorites[:data][0][:id]).to be_a(String)
        expect(favorites[:data][0][:type]).to be_a(String)
        expect(favorites[:data][0][:type]).to eq("favorites")
        expect(favorites[:data][0][:attributes]).to be_a(Hash)

        expect(favorites[:data][0][:attributes]).to have_key(:country)
        expect(favorites[:data][0][:attributes]).to have_key(:recipe_link)
        expect(favorites[:data][0][:attributes]).to have_key(:recipe_title)
        expect(favorites[:data][0][:attributes]).to have_key(:created_at)

        expect(favorites[:data][0][:attributes][:country]).to be_a(String)
        expect(favorites[:data][0][:attributes][:recipe_link]).to be_a(String)
        expect(favorites[:data][0][:attributes][:recipe_title]).to be_a(String)
        expect(favorites[:data][0][:attributes][:created_at]).to be_a(String)
      end
    end

    describe "sad paths" do
      it "returns an error message with invalid api_key" do
        invalid_api_key = "nacho-key"

        get "/api/v1/favorites", params: { api_key: invalid_api_key }

        expect(response).not_to be_successful
        expect(response.status).to eq(401)

        error_response = JSON.parse(response.body, symbolize_names: true)
        expect(error_response).to be_a(Hash)
        expect(error_response).to have_key(:error)
        expect(error_response[:error]).to eq("Invalid API key")
      end

      it "returns an empty array when user has no favorites" do
        joey_2 = User.create!(name: "Joey", email: "joeydoesgood@gmailjoey.com", password: "Joey", password_confirmation: "Joey")

        get "/api/v1/favorites", params: { api_key: joey_2.api_key }

        expect(response).to be_successful
        expect(response.status).to eq(200)

        favorites = JSON.parse(response.body, symbolize_names: true)
        expect(favorites).to be_a(Hash)
        expect(favorites).to have_key(:data)
        expect(favorites[:data]).to be_an(Array)
        expect(favorites[:data].length).to eq(0)
      end
    end
  end
end