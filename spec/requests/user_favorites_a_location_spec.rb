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

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:location)
      expect(result[:data]).to have_key(:relationships)
      expect(result[:data][:relationships]).to have_key(:user)
    end

    it 'requires an api key to complete or will fail' do
      user = create(:user)

      payload = {
        location: 'Denver, CO'
      }

      post '/api/v1/favorites', params: payload

      expect(response.status).to eq(401)
    end

    it 'requires a location to complete or will fail' do
      user = create(:user)

      payload = {
        api_key:  user.api_key
      }

      post '/api/v1/favorites', params: payload

      expect(response.status).to eq(401)
    end
  end
end
