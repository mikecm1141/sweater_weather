class WeatherResultSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location_string

  attributes :currently,
             :hourly,
             :daily
end
