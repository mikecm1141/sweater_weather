require 'rails_helper'

describe 'User requests location weather' do
  context 'via GET /api/v1/forecast?location=[city],[state]' do
    it 'returns the weather based on that location' do
      VCR.use_cassette('api_weather_result') do
        get '/api/v1/forecast?location=denver,co'

        result = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(result).to have_key(:data)
        expect(result[:data]).to have_key(:attributes)
        expect(result[:data][:attributes]).to have_key(:currently)
        expect(result[:data][:attributes]).to have_key(:hourly)
        expect(result[:data][:attributes]).to have_key(:daily)
      end
    end
  end
end
