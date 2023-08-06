class PhotoService
  def conn
    Faraday.new(url: "https://api.unsplash.com") do |f|
      f.params["client_id"] = ENV["PHOTS_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_all_photos(string)
    get_url("search/photos?page=1&query=#{string}")
  end
end