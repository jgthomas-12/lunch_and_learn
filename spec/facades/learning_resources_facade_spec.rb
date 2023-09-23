require "rails_helper"

RSpec.describe LearningResourcesFacade do
  describe "#get_country_photos(country)" do
    it "returns a list of ten photo objects for a specified country" do
      country = "laos"
      photos = LearningResourcesFacade.new.get_country_photos(country)
      expect(photos).to be_an(Array)

      expect(photos.first).to have_key(:id)
      expect(photos.first).to have_key(:urls)
      expect(photos.first[:urls]).to have_key(:raw)
      expect(photos.first[:urls][:raw]).to be_a(String)

      expect(photos.first).to have_key(:alt_description)
      expect(photos.first[:alt_description]).to be_a(String)
    end
  end

  describe "#get_country_video(country)" do
    it "returns one video object for a specified country" do
      country = "laos"
      video_data = LearningResourcesFacade.new.get_country_video(country)
      expect(video_data).to be_a(Hash)
      expect(video_data).to have_key(:items)
      expect(video_data[:items]).to be_an(Array)

      expect(video_data[:items][0]).to have_key(:id)
      expect(video_data[:items][0][:id]).to be_a(Hash)
      expect(video_data[:items][0][:id]).to have_key(:videoId)
      expect(video_data[:items][0][:id][:videoId]).to be_a(String)

      expect(video_data[:items][0]).to have_key(:snippet)
      expect(video_data[:items][0][:snippet]).to be_a(Hash)
      expect(video_data[:items][0][:snippet]).to have_key(:title)
      expect(video_data[:items][0][:snippet][:title]).to be_a(String)
    end
  end

  describe "#learning_resource(country)" do
    it "returns a LearningResource object with correct attributes", :vcr do
      country = "laos"
      resource = LearningResourcesFacade.new.learning_resource(country)

      expect(resource).to be_a(LearningResource)
    end
  end
end
