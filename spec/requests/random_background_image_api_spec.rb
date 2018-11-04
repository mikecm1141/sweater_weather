require 'rails_helper'

describe 'Retrieves a random background' do
  context 'via GET /api/v1/backgrounds?location=[city],[state]' do
    it 'returns an image based on city,state' do
      get '/api/v1/backgrounds?location=denver,co'

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:id)
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:random_image_url)
      expect(result[:data][:attributes][:random_image_url]).to be_a(String)
    end
  end
end
