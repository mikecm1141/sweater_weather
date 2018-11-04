class WeatherResult
  include ResultBuilder

  def initialize(location)
    @location = location.split(',')
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

  def dark_sky_service
    DarkSkyService.new
  end

  def forecast
    @forecast ||= dark_sky_service.weather(coordinates[:lat], coordinates[:lng])
  end
end
