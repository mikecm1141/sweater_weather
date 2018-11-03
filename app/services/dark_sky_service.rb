class DarkSkyService
  def weather(lat, long)
    get_json("forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{long}")
  end

  private

  def conn
    Faraday.new(url: 'https://api.darksky.net/')
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
