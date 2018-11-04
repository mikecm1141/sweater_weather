class GoogleService
  def coordinates(city, state)
    get_json("/maps/api/geocode/json?address=#{city}+#{state}&key=#{ENV['GOOGLE_API_KEY']}")[:results]
  end

  private

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/')
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
