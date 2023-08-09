require "rails_helper"

RSpec.describe "POST /api/v1/favorites" do
  before(:each) do
    @joey = User.create!(
      name: "Joey",
      email: "joeydoesgood@gmailjoey.com",
      password: "Joey",
      password_confirmation: "Joey",
    )
  end
  describe "happy path" do
    it "adds recipes to a favorited list for a particular user" do
      valid_params = {
        api_key: @joey.api_key,
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/.....",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post "/api/v1/favorites", params: valid_params, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(201)
      favorite_response = JSON.parse(response.body, symbolize_names: true)
      expect(favorite_response).to be_a(Hash)
      expect(favorite_response).to have_key(:success)
      expect(favorite_response).to have_value("Favorite added successfully")
    end
  end

  describe "sad path" do
    it "doesn't add recipes to a favorited list with invalid API key" do
      invalid_params = {
        api_key: "nacho-key",
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/.....",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post "/api/v1/favorites", params: invalid_params, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      bad_response = JSON.parse(response.body, symbolize_names: true)
      expect(bad_response).to be_a(Hash)
      expect(bad_response).to have_key(:error)
      expect(bad_response).to have_value("Invalid api_key")
    end
  end
end
