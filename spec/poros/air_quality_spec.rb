require "rails_helper"

RSpec.describe AirQuality do
  it "exists and has attributes" do
    data = {
      overall_aqi: 27,
      "PM2.5": { concentration: 8.45 },
      CO: { concentration: 547.41 }
    }
    city = "Abuja"

    air_quality = AirQuality.new(data, city)

    expect(air_quality).to be_an(AirQuality)

    expect(air_quality.city).to be_a(String)
    expect(air_quality.aqi).to be_an(Integer)
    expect(air_quality.pm25_concentration).to be_a(Float)
    expect(air_quality.co_concentration).to be_a(Float)

    expect(air_quality.id).to eq("null")
    expect(air_quality.city).to eq(city)
    expect(air_quality.aqi).to eq(data[:overall_aqi])
    expect(air_quality.pm25_concentration).to eq(data[:"PM2.5"][:concentration])
    expect(air_quality.co_concentration).to eq(data[:CO][:concentration])
  end
end
