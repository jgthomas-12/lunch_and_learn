class LearningResource
  attr_reader :id,
              :country,
              :video,
              :images

  def initialize(country, photos, video_data)
    @id = "null"
    @country = country
    @video = video_method(video_data)
    @images = images_method(photos)
  end

  def images_method(photos)
    photos.map do |photo|
      {
        alt_tag: photo[:alt_description],
        url: photo[:urls][:raw]
      }
    end
  end

  def video_method(video_data)
    data = {
      title: video_data[:items][0][:snippet][:title],
      youtube_video_id: video_data[:items][0][:id][:videoId]
    }
    data
  end
end