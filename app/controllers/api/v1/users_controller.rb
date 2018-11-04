class Api::V1::UsersController < ApplicationController
  def create
    render json: User.create(user_params), status: 201
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
