class CountryService
  def conn
    Faraday.new(url: "https://restcountries.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_random_country
    countries = get_url("/v3.1/all")
    countries.sample
  end

  def get_country(country)
    country = get_url("/v3.1/name/#{country}")
    country[0]
  end
end
