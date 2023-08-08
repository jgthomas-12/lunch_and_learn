require "rails_helper"

RSpec.describe "API V1 Users", type: :request do
  describe "POST /api/v1/users" do
    it "creates a new user with unique api key" do
      valid_params = {
        name: "Odell",
        email: "goodboy@ruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      }

      post "/api/v1/users", params: valid_params, as: :json 
    end
  end
end