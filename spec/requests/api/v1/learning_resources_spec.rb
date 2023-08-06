require "rails_helper"

RSpec.describe "API V1 learning resources request", type: :request do
  describe "/api/v1/learning_resources" do
    describe "happy path" do
      it "returns one learning resource in compliance with API JSON", :vcr do

        get "/api/v1/learning_resources", params: { country: "laos"}, headers: { 'Accept' => 'application/json' }
        # get "/api/v1/learning_resources?country=laos"

      end
    end
  end
end
