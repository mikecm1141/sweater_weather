require 'rails_helper'

describe 'User requests location weather' do
  context 'via GET /api/v1/forecast?location=[city],[state]' do
    it 'returns the weather based on that location' do
      VCR.use_cassette('api_weather_result') do
        get '/api/v1/forecast?location=denver,co'

        result = JSON.parse(response.body)

        require 'pry'; binding.pry

        expect(response).to be_successful
        expect(result).to have_key(:data)
      end
    end
  end
end
