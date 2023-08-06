class PhotosFacade
  def service
    PhotoService.new
  end

  def get_photos(string)
    request = service.get_all_photos(string)
    photos = request[:results].map do |result|
      Photo.new(result)
    end
  end
end