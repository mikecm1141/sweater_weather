class Api::V1::SessionsController < ApplicationController
  before_action :find_user, :validate_user

  def create
    render json: UserSerializer.new(find_user), status: 200
  end

  private

  def session_params
    params.permit(:email, :password)
  end

  def find_user
    @find_user ||= User.find_by_email(session_params[:email])
  end

  def valid_password?
    find_user.authenticate(session_params[:password])
  end

  def validate_user
    render json: nil, status: 403 unless find_user && valid_password?
  end
end
