require "rails_helper"

RSpec.describe "POST /api/v1/sessions", type: :request do
  before(:each) do
    joey = User.create!(
      name: "Joey",
      email: "joeydoesgood@gmailjoey.com",
      password: "Joey",
      password_confirmation: "Joey",
    )
  end

  describe "happy path" do
    it "logs in a user, body payload" do

      login_params = {
        email: "joeydoesgood@gmailjoey.com",
        password: "Joey"
      }

      post "/api/v1/sessions", params: login_params, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(200)
      joey = JSON.parse(response.body, symbolize_names: true)

      expect(joey).to be_a(Hash)
      expect(joey).to have_key(:data)
      expect(joey[:data]).to be_a(Hash)
      expect(joey[:data]).to have_key(:id)
      expect(joey[:data]).to have_key(:type)
      expect(joey[:data]).to have_key(:attributes)

      expect(joey[:data][:id]).to be_a(String)
      expect(joey[:data][:type]).to be_a(String)
      expect(joey[:data][:attributes]).to be_a(Hash)

      expect(joey[:data][:attributes]).to have_key(:name)
      expect(joey[:data][:attributes]).to have_key(:email)
      expect(joey[:data][:attributes]).to have_key(:api_key)

      expect(joey[:data][:attributes][:name]).to be_a(String)
      expect(joey[:data][:attributes][:email]).to be_a(String)
      expect(joey[:data][:attributes][:api_key]).to be_a(String)
    end
  end

  describe "sad path" do
    it "returns an error message with invalid credentials" do
      invalid_params = {
        email: "joeydoesgood@gmailjoey.com",
        password: "Not Joey Joey"
      }

      post "/api/v1/sessions", params: invalid_params, as: :json

      expect(response).not_to be_successful
      expect(response.status).to eq(401)
      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response).to have_key(:error)
      expect(error_response).to have_value("Invalid Credentials")
    end

    it "returns an error message with missing email" do
      missing_email = {
        password: "Not Joey Joey"
      }

      post "/api/v1/sessions", params: missing_email, as: :json

      expect(response).not_to be_successful
      expect(response.status).to eq(401)
      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response).to have_key(:error)
      expect(error_response).to have_value("Invalid Credentials")
    end

    it "returns an error message with missing password" do
      missing_pass = {
        email: "joeydoesgood@gmailjoey.com",
      }

      post "/api/v1/sessions", params: missing_pass, as: :json

      expect(response).not_to be_successful
      expect(response.status).to eq(401)
      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response).to have_key(:error)
      expect(error_response).to have_value("Invalid Credentials")
    end
  end
end