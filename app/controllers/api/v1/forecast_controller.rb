class Api::V1::ForecastController < ApplicationController
  def show
    weather_result = WeatherResult.new(params[:location])
    render json: WeatherResultSerializer.new(weather_result)
  end
end
