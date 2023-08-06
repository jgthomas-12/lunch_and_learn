class Recipe
  attr_reader :title,
              :url,
              :country,
              :image_url
              # :id

  def initialize(data, country)
    # @id = nil
    @title = data[:recipe][:label]
    @url = data[:recipe][:url]
    @country = country
    @image_url = data[:recipe][:image]
  end
end