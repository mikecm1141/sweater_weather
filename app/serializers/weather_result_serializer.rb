class WeatherResultSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location

  attributes :currently,
             :hourly,
             :daily
end
