require "rails_helper"

RSpec.describe "Video Service" do
  xit "returns a youtube json object" do
    video_data = VideoService.new.get_video
  end
end