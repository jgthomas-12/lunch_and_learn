require "rails_helper"

RSpec.describe AirQualityFacade do
  describe "#air_quality" do
    it "returns an object with the air quality for a specified city" do
      quality = AirQualityFacade.new.air_quality("Beijing")
    end
  end
end