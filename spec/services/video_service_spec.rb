require "rails_helper"

RSpec.describe "Video Service" do
  describe "#get_video_data" do
    it "returns a youtube json object" do
      video_data = VideoService.new.get_video_data("singapore")

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
end