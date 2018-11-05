class Api::V1::FavoritesController < ApplicationController
  before_action :find_user, :validate_api_key
  before_action :validate_location, :favorite, only: :create

  def create
    render json: FavoriteSerializer.new(favorite), status: 201
  end

  def index
    render json: FavoritesSerializer.new(user.favorites), status: 200
  end

  private
  
  attr_reader :user

  def favorite_params
    params.permit(:location, :api_key)
  end

  def find_user
    @user ||= User.find_by_api_key(favorite_params[:api_key])
  end

  def validate_api_key
    render json: nil, status: 401 if user.nil?
  end

  def validate_location
    render json: nil, status: 401 if favorite_params[:location].nil?
  end

  def favorite
    find_user.favorites.find_or_create_by(location: favorite_params[:location])
  end
end
