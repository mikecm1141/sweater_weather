require 'rails_helper'

describe 'User gets a list of favorite cities' do
  context 'via GET /api/v1/favorites' do
    it 'returns cities and their current weather' do
      VCR.use_cassette('user_favorites') do
        user = create(:user)
        user.favorites.create(location: 'Denver, CO')
        user.favorites.create(location: 'Honolulu, HI')

        payload = {
          api_key: user.api_key
        }

        get '/api/v1/favorites', params: payload

        result = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(result).to have_key(:data)
        expect(result[:data]).to be_a(Array)
        expect(result[:data].size).to eq(2)
        expect(result[:data][0]).to have_key(:meta)
        expect(result[:data][0][:meta]).to have_key(:data)
        expect(result[:data][0][:meta][:data]).to have_key(:id)
        expect(result[:data][0][:meta][:data]).to have_key(:attributes)
        expect(result[:data][0][:meta][:data][:attributes]).to have_key(:currently)
        expect(result[:data][1]).to have_key(:meta)
        expect(result[:data][1][:meta]).to have_key(:data)
        expect(result[:data][1][:meta][:data]).to have_key(:id)
        expect(result[:data][1][:meta][:data]).to have_key(:attributes)
        expect(result[:data][1][:meta][:data][:attributes]).to have_key(:currently)
      end
    end
  end
end
