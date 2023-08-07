class Recipe
  attr_reader :title,
              :url,
              :country,
              :image_url,
              :type,
              :id

  def initialize(data, country)
    @id = "null"
    @title = data[:recipe][:label]
    @url = data[:recipe][:url]
    @country = country
    @image_url = data[:recipe][:image]
  end
end
