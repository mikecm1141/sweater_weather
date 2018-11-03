require 'rails_helper'

describe GoogleService do
  subject { GoogleService.new }

  it 'exists' do
    expect(subject).to be_a(GoogleService)
  end

  context 'Instance Methods' do
    context '#coordinates(city, state)' do
      it 'returns coordinates for a city/state' do
        VCR.use_cassette("google_geocoding_results") do
          expect(subject.coordinates('Denver', 'CO')).to be_a(Array)
          expect(subject.coordinates('Denver', 'CO')[0][:geometry]).to have_key(:location)
          expect(subject.coordinates('Denver', 'CO')[0][:geometry][:location]).to have_key(:lat)
          expect(subject.coordinates('Denver', 'CO')[0][:geometry][:location]).to have_key(:lng)
        end
      end
    end
  end
end