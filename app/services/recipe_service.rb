class RecipeService
  def conn
    Faraday.new(url: "https://api.edamam.com") do |f|
      f.params["app_id"] = ENV["EDAMAMS_ID"]
      f.params["app_key"] = ENV["EDAMAMS_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_all_recipes(country)
    get_url("/api/recipes/v2/?type=public&q=#{country}")
  end
end
 