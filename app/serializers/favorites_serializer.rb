class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  attributes 

  meta do |favorite|
    weather = WeatherResult.new(favorite.location)
    WeatherFavoriteSerializer.new(weather)
  end
end
