class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by_api_key(favorite_params[:api_key])
    user.favorites.find_or_create_by(location: params[:location])
  end

  private

  def favorite_params
    params.permit(:location, :api_key)
  end
end
