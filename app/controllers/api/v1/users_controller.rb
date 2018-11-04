class Api::V1::UsersController < ApplicationController
  before_action :new_user, :save_user, :validate_creation

  def create
    render json: NewUserSerializer.new(new_user), status: 201
  end

  private

  def new_user
    @new_user ||= User.new(user_params)
  end

  def save_user
    new_user.save
  end

  def validate_creation
    render json: FailedRegistrationSerializer.new(new_user), status: 403, message: 'Unable to register new user.' unless save_user
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
