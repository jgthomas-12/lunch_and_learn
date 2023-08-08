require "rails_helper"

RSpec.describe "API V1 learning resources request", type: :request do
  describe "/api/v1/learning_resources" do
    describe "happy path" do
      it "returns one learning resource in compliance with API JSON", :vcr do

        get "/api/v1/learning_resources", params: { country: "laos"}, headers: { 'Accept' => 'application/json' }
        # get "/api/v1/learning_resources?country=laos"
        resource = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful

        expect(resource).to have_key(:data)
        expect(resource[:data]).to be_a(Hash)

        expect(resource[:data]).to have_key(:id)
        expect(resource[:data][:id]).to be_a(String)
        expect(resource[:data][:id]).to eq("null")

        expect(resource[:data]).to have_key(:type)
        expect(resource[:data][:type]).to be_a(String)
        expect(resource[:data][:type]).to eq("learning_resource")

        expect(resource[:data]).to have_key(:attributes)
        expect(resource[:data][:attributes]).to be_a(Hash)

        expect(resource[:data][:attributes]).to have_key(:country)
        expect(resource[:data][:attributes]).to have_key(:video)
        expect(resource[:data][:attributes]).to have_key(:images)

        expect(resource[:data][:attributes][:country]).to be_a(String)
        expect(resource[:data][:attributes][:video]).to be_a(Hash)
        expect(resource[:data][:attributes][:images]).to be_an(Array)

        expect(resource[:data][:attributes][:video]).to have_key(:title)
        expect(resource[:data][:attributes][:video]).to have_key(:youtube_video_id)

        expect(resource[:data][:attributes][:video][:title]).to be_a(String)
        expect(resource[:data][:attributes][:video][:youtube_video_id]).to be_a(String)

        expect(resource[:data][:attributes][:images][0]).to have_key(:alt_tag)
        expect(resource[:data][:attributes][:images][0]).to have_key(:url)
      end
    end
  end
end
