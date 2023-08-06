require "rails_helper"

RSpec.describe "Photo Service" do
  it "can get a list of ten photos from a specified keyword" do
    photos = PhotoService.new.get_all_photos("laos")
    balloon = photos[:results].first

    expect(balloon).to be_a(Hash)
    expect(balloon).to have_key(:alt_description)
    expect(balloon[:alt_description]).to be_a(String)

    expect(balloon).to have_key(:urls)
    expect(balloon[:urls]).to have_key(:raw)
    expect(balloon[:urls][:raw]).to be_a(String)
  end
end