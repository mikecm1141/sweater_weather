require 'rails_helper'

describe 'Retrieves a random background' do
  context 'via GET /api/v1/backgrounds?location=[city],[state]' do
    it 'returns an image based on city,state' do
      get '/api/v1/backgrounds?location=denver,co'

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(result).to have_key(:data)
      expect(result).to have_key(:id)
    end
  end
end
