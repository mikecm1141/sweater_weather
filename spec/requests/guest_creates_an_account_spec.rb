require 'rails_helper'

describe 'Guest creates an account' do
  context 'via POST /api/v1/users' do
    it 'registers a user and returns an API key' do
      payload = {
        email:                 'whatever@example.com',
        password:              'password',
        password_confirmation: 'password'
      }

      post '/api/v1/users', params: payload

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:api_key)
      expect(result[:data][:attributes][:api_key]).to be_a(String)
    end
  end
end
