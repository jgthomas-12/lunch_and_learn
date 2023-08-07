class AirQualityFacade
  def initialize
    @air_quality_service = AirQualityService.new
    @country_service = CountryService.new
  end

  def capital(country)
    @city = @country_service.get_country(country)[:capital].first
  end

  def air_quality(country)
    capital = capital(country)
    city_air_quality = @air_quality_service.get_air_quality(capital)
    AirQuality.new(city_air_quality, capital)
  end
end