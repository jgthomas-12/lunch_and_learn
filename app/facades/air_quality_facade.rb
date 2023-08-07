class AirQualityFacade
  def service
    AirQualityService.new
  end

  def air_quality(city)
    request = service.get_air_quality(city)
    AirQuality.new(request)
  end
end