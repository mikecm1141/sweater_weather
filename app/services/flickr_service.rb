class FlickrService
  def location_images(lat, lng)
    conn = Faraday.new(url: 'https://api.flickr.com/')
    response = conn.get("/services/rest/?method=flickr.photos.search&api_key=#{ENV['FLICKR_API_KEY']}&lat=#{lat}&lon=#{lng}&format=json&nojsoncallback=1&extras=url_o")
    JSON.parse(response.body, symbolize_names: true)[:photos]
  end
end
