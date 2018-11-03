class WeatherResult
  def initialize(location)
    @location = location.split(',')
  end

  def location_string
    "#{location_hash[:city].capitalize}, #{location_hash[:state].upcase}"
  end

  def currently
    forecast[:currently]
  end

  def hourly
    forecast[:hourly]
  end

  def daily
    forecast[:daily]
  end

  private

  def google_service
    GoogleService.new
  end

  def dark_sky_service
    DarkSkyService.new
  end

  def coordinates
    @coordinates ||= google_service.coordinates(location_hash[:city], location_hash[:state])[0][:geometry][:location]
  end

  def forecast
    @forecast ||= dark_sky_service.weather(coordinates[:lat], coordinates[:lng])
  end

  def location_hash
    {
      city:  @location[0],
      state: @location[1]
    }
  end
end
