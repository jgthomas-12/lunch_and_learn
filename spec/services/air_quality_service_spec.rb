require "rails_helper"

RSpec.describe "Air Quality Service" do
  it "returns the air  quality json object with a specified city" do
    quality = AirQualityService.new.get_air_quality("Beijing")

    expect(quality).to be_a(Hash)
    expect(quality).to have_key(:CO)
    expect(quality).to have_key(:NO2)
    expect(quality).to have_key(:O3)
    expect(quality).to have_key(:SO2)
    expect(quality).to have_key(:"PM2.5")
    expect(quality).to have_key(:PM10)
    expect(quality).to have_key(:overall_aqi)

    expect(quality[:CO]).to have_key(:concentration)
    expect(quality[:NO2]).to have_key(:concentration)
    expect(quality[:O3]).to have_key(:concentration)
    expect(quality[:SO2]).to have_key(:concentration)
    expect(quality[:"PM2.5"]).to have_key(:concentration)
    expect(quality[:PM10]).to have_key(:concentration)
  end
end