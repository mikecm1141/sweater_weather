require 'rails_helper'

describe 'User logs in' do
  context 'via POST /api/v1/sessions' do
    it 'logs in user to retrieve API key' do
      user = create(:user)

      payload = {
        email:    'whatever@example.com',
        password: 'password'
      }

      post '/api/v1/sessions', params: payload
      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(result[:data][:attributes][:api_key]).to eq(user.api_key)
    end

    it 'returns 404 if user does not exist or bad password' do
      user = create(:user)

      payload = {
        email:    'whatevr@example.com',
        password: 'password'
      }

      post '/api/v1/sessions', params: payload
      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(403)
    end
  end
end
