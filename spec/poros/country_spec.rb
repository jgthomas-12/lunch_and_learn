require "rails_helper"

RSpec.describe Country do
  it "exits and has attributes" do

    data = {
      name: {
       common: "scotland"
      }
    }

    country = Country.new(data)
    expect(country).to be_a(Country)
    expect(country.name).to eq(data[:name][:common])
  end
end
