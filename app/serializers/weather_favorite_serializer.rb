class WeatherFavoriteSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location_string

  attributes :currently
end
