require "rails_helper"

RSpec.describe LearningResource do
  it "exists and has attributes" do
    photos = [
      {
        alt_description: 'A strange encounter with random friends along a river',
        urls: { raw: 'https://example.com/laos.jpg' }
      },
      {
        alt_description: 'An oxen of oxen',
        urls: { raw: 'https://example.com/still_laos.jpg' }
      }
    ]
    video_data = {
      items: [
        {
          snippet: {
            title: 'A crazy and wild ride'
          },
          id: {
            videoId: 'uw8hjVqxMXw'
          }
        }
      ]
    }
    country = "laos"

    expected = {
      title: 'A crazy and wild ride',
      youtube_video_id: 'uw8hjVqxMXw'
    }

    resource = LearningResource.new(country, photos, video_data)

    expect(resource).to be_a(LearningResource)
    expect(resource.id).to eq("null")
    expect(resource.country).to eq(country)
    expect(resource.images).to be_an(Array)
    expect(resource.images.size).to eq(2)
    expect(resource.images.first).to include(alt_tag: 'A strange encounter with random friends along a river', url: 'https://example.com/laos.jpg')
    expect(resource.images.last).to include(alt_tag: 'An oxen of oxen', url: 'https://example.com/still_laos.jpg')
    expect(resource.video).to eq(expected)
  end
end