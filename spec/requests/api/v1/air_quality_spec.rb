require "rails_helper"

RSpec.describe "API V1 Air Quality request", type: :request do
  describe "GET /api/v1/air_quality?country=Nigeria" do
    describe "happy path" do
      it "returns air quality JSON object from a specified country", :vcr do

        get '/api/v1/air_quality', params: { country: 'france' }, headers: { 'Accept' => 'application/json' }

        air_quality = JSON.parse(response.body, symbolize_names: true)

        expect(air_quality).to have_key(:data)
        expect(air_quality[:data]).to be_a(Hash)

        expect(air_quality[:data]).to have_key(:id)
        expect(air_quality[:data][:id]).to be_a(String)
        expect(air_quality[:data][:id]).to eq("null")

        expect(air_quality[:data]).to have_key(:type)
        expect(air_quality[:data][:type]).to be_a(String)
        expect(air_quality[:data][:type]).to eq("air_quality")

        expect(air_quality[:data]).to have_key(:attributes)
        expect(air_quality[:data][:attributes]).to be_a(Hash)

        expect(air_quality[:data][:attributes]).to have_key(:city)
        expect(air_quality[:data][:attributes]).to have_key(:aqi)
        expect(air_quality[:data][:attributes]).to have_key(:pm25_concentration)
        expect(air_quality[:data][:attributes]).to have_key(:co_concentration)

        expect(air_quality[:data][:attributes][:city]).to be_a(String)
        expect(air_quality[:data][:attributes][:aqi]).to be_a(Integer)
        expect(air_quality[:data][:attributes][:pm25_concentration]).to be_a(Float)
        expect(air_quality[:data][:attributes][:co_concentration]).to be_a(Float)
      end
    end
  end
end