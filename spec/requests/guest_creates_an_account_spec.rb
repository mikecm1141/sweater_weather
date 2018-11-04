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

    it 'returns an error if email is taken or non-matching password' do
      create(:user)

      payload = {
        email:                 'whatever@example.com',
        password:              'password',
        password_confirmation: 'passwod'
      }

      post '/api/v1/users', params: payload

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(403)
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:errors)
      expect(result[:data][:attributes][:errors]).to have_key(:email)
      expect(result[:data][:attributes][:errors]).to have_key(:password_confirmation)
      expect(result[:data][:attributes][:errors][:email]).to eq(['has already been taken'])
      expect(result[:data][:attributes][:errors][:password_confirmation]).to eq(['doesn\'t match Password'])
    end
  end
end
