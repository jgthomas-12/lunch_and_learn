require "rails_helper"

RSpec.describe AirQualityFacade do
  describe "#air_quality" do
    it "returns an air quality object for a specified city" do
      country = "france"
      quality = AirQualityFacade.new.air_quality(country)

      expect(quality).to be_an(AirQuality)
      expect(quality.city).to be_an(String)
      expect(quality.aqi).to be_an(Integer)
      expect(quality.pm25_concentration).to be_a(Float)
      expect(quality.co_concentration).to be_a(Float)
    end
  end

  describe "#capital" do
    it "returns the capital city for a given country" do
      country = "france"
      capital = AirQualityFacade.new.capital(country)

      expect(capital).to be_a(String)
      expect(capital).to eq("Paris")
    end
  end
end