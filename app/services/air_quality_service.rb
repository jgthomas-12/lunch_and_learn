class AirQualityService
  def conn
    Faraday.new(url: "https://api.api-ninjas.com") do |f|
      f.headers["X-Api-Key"] = ENV["AIRS_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_air_quality(city)
    get_url("/v1/airquality?city=#{city}")
  end
end
