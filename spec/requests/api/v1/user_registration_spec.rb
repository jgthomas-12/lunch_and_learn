require "rails_helper"

RSpec.describe "API V1 Users", type: :request do
  describe "POST /api/v1/users" do
    describe "happy path" do
      it "creates a new user with unique api key" do
        valid_params = {
            name: "Odell",
            email: "goodboy@ruffruff.com",
            password: "treats4lyf",
            password_confirmation: "treats4lyf"
        }

        post "/api/v1/users", params: valid_params, as: :json

        user = User.first
        expect(response.status).to eq(201)
        expect(User.count).to eq(1)
        expect(user.name).to eq(valid_params[:name])
        expect(user.email).to eq(valid_params[:email])
        expect(user.api_key).to be_present
        expect(user.password_digest).to be_present
      end
    end

    describe "sad path" do
      it "returns an error message if passwords do not match" do
        invalid_params = {
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "nofuggintreats"
        }

        post "/api/v1/users", params: invalid_params, as: :json

        expect(response).not_to be_successful
        expect(response.status).to eq(422)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end