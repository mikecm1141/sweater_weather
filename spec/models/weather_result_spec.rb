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

    context '#hourly' do
      it 'returns the hourly weather' do
        VCR.use_cassette("weather_results") do
          expect(subject.hourly).to be_a(Hash)
          expect(subject.hourly).to have_key(:summary)
          expect(subject.hourly).to have_key(:icon)
          expect(subject.hourly).to have_key(:data)
          expect(subject.hourly[:data]).to be_a(Array)
          expect(subject.hourly[:data][0]).to have_key(:time)
          expect(subject.hourly[:data][0]).to have_key(:summary)
          expect(subject.hourly[:data][0]).to have_key(:icon)
          expect(subject.hourly[:data][0]).to have_key(:precipIntensity)
          expect(subject.hourly[:data][0]).to have_key(:precipProbability)
          expect(subject.hourly[:data][0]).to have_key(:precipType)
          expect(subject.hourly[:data][0]).to have_key(:temperature)
          expect(subject.hourly[:data][0]).to have_key(:apparentTemperature)
          expect(subject.hourly[:data][0]).to have_key(:dewPoint)
          expect(subject.hourly[:data][0]).to have_key(:humidity)
          expect(subject.hourly[:data][0]).to have_key(:pressure)
          expect(subject.hourly[:data][0]).to have_key(:windSpeed)
          expect(subject.hourly[:data][0]).to have_key(:windGust)
          expect(subject.hourly[:data][0]).to have_key(:windBearing)
          expect(subject.hourly[:data][0]).to have_key(:cloudCover)
          expect(subject.hourly[:data][0]).to have_key(:uvIndex)
          expect(subject.hourly[:data][0]).to have_key(:visibility)
          expect(subject.hourly[:data][0]).to have_key(:ozone)
        end
      end
    end

    context '#daily' do
      it 'returns the daily weather' do
        VCR.use_cassette("weather_results") do
          expect(subject.daily).to be_a(Hash)
          expect(subject.daily).to have_key(:summary)
          expect(subject.daily).to have_key(:icon)
          expect(subject.daily).to have_key(:data)
          expect(subject.daily[:data]).to be_a(Array)
          expect(subject.daily[:data][0]).to have_key(:time)
          expect(subject.daily[:data][0]).to have_key(:summary)
          expect(subject.daily[:data][0]).to have_key(:icon)
          expect(subject.daily[:data][0]).to have_key(:sunriseTime)
          expect(subject.daily[:data][0]).to have_key(:sunsetTime)
          expect(subject.daily[:data][0]).to have_key(:moonPhase)
          expect(subject.daily[:data][0]).to have_key(:precipIntensity)
          expect(subject.daily[:data][0]).to have_key(:precipIntensityMax)
          expect(subject.daily[:data][0]).to have_key(:precipIntensityMaxTime)
          expect(subject.daily[:data][0]).to have_key(:precipProbability)
          expect(subject.daily[:data][0]).to have_key(:precipType)
          expect(subject.daily[:data][0]).to have_key(:temperatureHigh)
          expect(subject.daily[:data][0]).to have_key(:temperatureHighTime)
          expect(subject.daily[:data][0]).to have_key(:temperatureLow)
          expect(subject.daily[:data][0]).to have_key(:temperatureLowTime)
          expect(subject.daily[:data][0]).to have_key(:apparentTemperatureHigh)
          expect(subject.daily[:data][0]).to have_key(:apparentTemperatureHighTime)
          expect(subject.daily[:data][0]).to have_key(:apparentTemperatureLow)
          expect(subject.daily[:data][0]).to have_key(:apparentTemperatureLowTime)
          expect(subject.daily[:data][0]).to have_key(:dewPoint)
          expect(subject.daily[:data][0]).to have_key(:humidity)
          expect(subject.daily[:data][0]).to have_key(:pressure)
          expect(subject.daily[:data][0]).to have_key(:windSpeed)
          expect(subject.daily[:data][0]).to have_key(:windGust)
          expect(subject.daily[:data][0]).to have_key(:windGustTime)
          expect(subject.daily[:data][0]).to have_key(:windBearing)
          expect(subject.daily[:data][0]).to have_key(:cloudCover)
          expect(subject.daily[:data][0]).to have_key(:uvIndex)
          expect(subject.daily[:data][0]).to have_key(:uvIndexTime)
          expect(subject.daily[:data][0]).to have_key(:visibility)
          expect(subject.daily[:data][0]).to have_key(:ozone)
          expect(subject.daily[:data][0]).to have_key(:temperatureMin)
          expect(subject.daily[:data][0]).to have_key(:temperatureMinTime)
          expect(subject.daily[:data][0]).to have_key(:temperatureMax)
          expect(subject.daily[:data][0]).to have_key(:temperatureMaxTime)
          expect(subject.daily[:data][0]).to have_key(:apparentTemperatureMin)
          expect(subject.daily[:data][0]).to have_key(:apparentTemperatureMinTime)
          expect(subject.daily[:data][0]).to have_key(:apparentTemperatureMax)
          expect(subject.daily[:data][0]).to have_key(:apparentTemperatureMaxTime)
        end
      end
    end
  end
end
