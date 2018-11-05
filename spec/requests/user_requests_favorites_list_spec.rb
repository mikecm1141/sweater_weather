require 'rails_helper'

describe 'User gets a list of favorite cities' do
  context 'via GET /api/v1/favorites' do
    it 'returns cities and their current weather' do
      user = create(:user)
      user.favorites.create(location: 'Denver, CO')
      user.favorites.create(location: 'Honolulu, HI')

      payload = {
        api_key: user.api_key
      }

      get '/api/v1/favorites', params: payload
    end
  end
end
