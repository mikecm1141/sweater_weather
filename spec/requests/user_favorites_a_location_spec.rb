require 'rails_helper'

describe 'User favorites a location' do
  context 'via POST /api/v1/favorites' do
    it 'requires an api key to complete' do
      user = create(:user)

      payload = {
        location: 'Denver, CO',
        api_key:  user.api_key
      }

      post '/api/v1/favorites', params: payload

      expect(response.status).to eq(201)
    end
  end
end
