class AirQualityFacade
  def initialize
    @air_quality_service = AirQualityService.new
    @country_service = CountryService.new
  end

  def city(country)
    @city = @country_service.get_country(country)
    @cap_city = @city[:capital][0]
  end

  def air_quality(country)
    capital = city(country)
    city_air_quality = @air_quality_service.get_air_quality(capital)
    AirQuality.new(city_air_quality, capital)
  end
end