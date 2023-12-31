class AirQuality
  attr_reader :city,
              :aqi,
              :pm25_concentration,
              :co_concentration,
              :id

  def initialize(data, city)
    @id = "null"
    @city = city
    @aqi = data[:overall_aqi]
    @pm25_concentration = data[:"PM2.5"][:concentration]
    @co_concentration = data[:CO][:concentration]
  end
end