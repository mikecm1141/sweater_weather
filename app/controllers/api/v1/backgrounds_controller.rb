class Api::V1::BackgroundsController < ApplicationController
  def show
    image_result = ImageResult.new(params[:location])
    render json: ImageResultSerializer.new(image_result)
  end
end
