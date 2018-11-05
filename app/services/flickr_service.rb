class FlickrService
  def location_images(lat, lng)
    get_json("/services/rest/?method=flickr.photos.search&api_key=#{ENV['FLICKR_API_KEY']}&lat=#{lat}&lon=#{lng}&format=json&nojsoncallback=1&extras=url_o")[:photos]
  end

  private

  def conn
    Faraday.new(url: 'https://api.flickr.com/')
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
