require "rails_helper"

RSpec.describe Photo do
  it "exists and has attributes" do
    data = {
      alt_description: "A picture of necture",
      urls: {
        raw: "https://phish.com/gross_a_phish_reference.jpg"
      }
    }

    photo = Photo.new(data)

    expect(photo).to be_a(Photo)
    expect(photo.alt_tag).to eq(data[:alt_description])
    expect(photo.url).to eq(data[:urls][:raw])
  end
end