require 'rails_helper'

describe WeatherResult do
  subject { WeatherResult.new('denver,co') }

  it 'exists' do
    expect(subject).to be_a(WeatherResult)
  end

  context 'Instance Methods' do
    context '#location_string' do
      it 'returns the current location as a formatted string' do
        VCR.use_cassette("weather_results") do
          expect(subject.location_string).to eq('Denver, CO')
        end
      end
    end

    context '#currently' do
      it 'returns the current weather' do
        VCR.use_cassette("weather_results") do
          expect(subject.currently).to be_a(Hash)
          expect(subject.currently).to have_key(:time)
          expect(subject.currently).to have_key(:summary)
          expect(subject.currently).to have_key(:icon)
          expect(subject.currently).to have_key(:nearestStormDistance)
          expect(subject.currently).to have_key(:precipIntensity)
          expect(subject.currently).to have_key(:precipProbability)
          expect(subject.currently).to have_key(:temperature)
          expect(subject.currently).to have_key(:apparentTemperature)
          expect(subject.currently).to have_key(:dewPoint)
          expect(subject.currently).to have_key(:humidity)
          expect(subject.currently).to have_key(:pressure)
          expect(subject.currently).to have_key(:windSpeed)
          expect(subject.currently).to have_key(:windGust)
          expect(subject.currently).to have_key(:windBearing)
          expect(subject.currently).to have_key(:cloudCover)
          expect(subject.currently).to have_key(:uvIndex)
          expect(subject.currently).to have_key(:visibility)
          expect(subject.currently).to have_key(:ozone)
        end
      end
    end
  end
end
