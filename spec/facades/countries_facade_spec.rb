require "rails_helper"

RSpec.describe CountriesFacade do
  describe "#get_country" do
    it "returns Country object with random country data" do
      thailand = {
        name: {
          common: "thailand"
        }
      }

      allow_any_instance_of(CountryService).to receive(:get_random_country).and_return(thailand)

      facade = CountriesFacade.new
      country = facade.get_country

      expect(country).to be_a(Country)
      expect(country.name).to eq("thailand")
      expect(country.name).to be_a(String)
    end
  end
end
