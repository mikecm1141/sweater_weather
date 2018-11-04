require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  after_save :generate_api_key

  private

  def generate_api_key
    require 'pry'; binding.pry
  end
end
