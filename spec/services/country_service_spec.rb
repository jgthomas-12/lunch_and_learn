require "rails_helper"

RSpec.describe "Country Service" do
  it "can get a random country", :vcr do
    service = CountryService.new
    random_country = service.get_random_country

    expect(random_country).to be_a(Hash)
    expect(random_country[:name]).to be_a(Hash)
    expect(random_country[:name]).to have_key(:common)
    expect(random_country[:name][:common]).to be_a(String)
  end

  it "can get a country with specified name", :vcr do
    service = CountryService.new
    france = service.get_country("france")

    expect(france[:capital]).to be_an(Array)
    expect(france[:capital][0]).to be_a(String)
  end
end