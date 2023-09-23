class VideoService
  def conn
    Faraday.new(url: "https://www.googleapis.com") do |f|
      f.params["key"] = ENV["GOOGS_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_video_data(string)
    get_url("/youtube/v3/search?&q=#{string}&channelId=UCluQ5yInbeAkkeCndNnUhpw&part=snippet")
  end
end
