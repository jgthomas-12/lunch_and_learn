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

    expected_video = {
      title: 'A crazy and wild ride',
      youtube_video_id: 'uw8hjVqxMXw'
    }

    resource = LearningResource.new(country, photos, video_data)

    expect(resource).to be_a(LearningResource)

    expect(resource.country).to eq(country)
    expect(resource.images).to be_an(Array)
    expect(resource.video).to be_a(Hash)

    expect(resource.images[0]).to have_key(:alt_tag)
    expect(resource.images[0][:alt_tag]).to be_a(String)
    expect(resource.images[0]).to have_key(:url)
    expect(resource.images[0][:url]).to be_a(String)

    expect(resource.video).to have_key(:title)
    expect(resource.video[:title]).to be_a(String)

    expect(resource.video).to have_key(:youtube_video_id)
    expect(resource.video[:youtube_video_id]).to be_a(String)

    expect(resource.id).to eq("null")
    expect(resource.country).to eq(country)
    expect(resource.images).to be_an(Array)
    expect(resource.images.size).to eq(2)
    expect(resource.images.first).to include(alt_tag: 'A strange encounter with random friends along a river', url: 'https://example.com/laos.jpg')
    expect(resource.images.last).to include(alt_tag: 'An oxen of oxen', url: 'https://example.com/still_laos.jpg')
    expect(resource.video).to eq(expected_video)
  end
end
