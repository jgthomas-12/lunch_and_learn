require "rails_helper"

RSpec.describe PhotosFacade do
  describe "#get_photos" do
    it "gets a list of photos for a specific keyword", :vcr do
      photos = PhotosFacade.new.get_photos("laos")
      expect(photos).to be_an(Array)
      expect(photos.first).to be_a(Photo)
    end
  end
end
