class LearningResourcesFacade
  def initialize
    @photo_service = PhotoService.new
    @video_service = VideoService.new
  end

  def get_country_photos(country)
    photos = @photo_service.get_all_photos(country)
    photos[:results]
  end

  def get_country_video(country)
    @video_service.get_video_data(country)
  end

  def learning_resource(country)
    photos = get_country_photos(country)
    video_data = get_country_video(country)
    LearningResource.new(country, photos, video_data)
  end


end