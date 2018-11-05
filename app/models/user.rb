require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :favorites

  after_save :generate_api_key

  def remove_favorite_location(location)
    favorites.find_by_location(location).destroy
  end

  private

  def generate_api_key
    update(api_key: SecureRandom.urlsafe_base64) if api_key.nil?
  end
end
