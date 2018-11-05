require 'rails_helper'

describe 'User deletes a favorite location' do
  context 'via DELETE /api/v1/favorites' do
    it 'removes that favorite' do
      VCR.use_cassette('delete_favorite_location') do
        user = create(:user)
        user.favorites.create(location: 'Denver, CO')
        user.favorites.create(location: 'Honolulu, HI')

        payload = {
          api_key:  user.api_key,
          location: 'Denver, CO'
        }

        delete '/api/v1/favorites', params: payload

        result = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(result).to have_key(:data)
        expect(result[:data]).to be_a(Array)
        expect(result[:data].size).to eq(1)
        expect(result[:data][0]).to have_key(:meta)
        expect(result[:data][0][:meta]).to have_key(:data)
        expect(result[:data][0][:meta][:data]).to have_key(:id)
        expect(result[:data][0][:meta][:data]).to have_key(:attributes)
        expect(result[:data][0][:meta][:data][:attributes]).to have_key(:currently)
      end
    end

    it 'requires an api key to complete or will fail' do
      user = create(:user)
      user.favorites.create(location: 'Denver, CO')
      user.favorites.create(location: 'Honolulu, HI')

      payload = {
        location: 'Denver, CO'
      }

      delete '/api/v1/favorites', params: payload

      expect(response.status).to eq(401)
    end
  end
end
