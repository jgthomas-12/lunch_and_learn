class CountriesFacade
  def service
    CountryService.new
  end

  def get_country
    request = service.get_random_country
    Country.new(request)
  end
end
