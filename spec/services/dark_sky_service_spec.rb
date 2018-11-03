require 'rails_helper'

describe DarkSkyService do
  subject { DarkSkyService.new }

  it 'exists' do
    expect(subject).to be_a(DarkSkyService)
  end

  context 'Instance Methods' do
    context '#weather(lat,long)' do
      it 'returns weather for that lat/long' do
        VCR.use_cassette("dark_sky_weather_results") do
          expect(subject.weather(37.8267,-122.4233)).to be_a(Hash)
          expect(subject.weather(37.8267,-122.4233)).to have_key(:currently)
          expect(subject.weather(37.8267,-122.4233)).to have_key(:minutely)
          expect(subject.weather(37.8267,-122.4233)).to have_key(:hourly)
          expect(subject.weather(37.8267,-122.4233)).to have_key(:daily)
        end
      end
    end
  end
end
