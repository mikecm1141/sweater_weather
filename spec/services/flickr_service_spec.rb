require 'rails_helper'

describe FlickrService do
  subject { FlickrService.new }

  it 'exists' do
    expect(subject).to be_a(FlickrService)
  end

  context 'Instance Methods' do
    context '#location_images(lat,long)' do
      it 'returns a collection of images based on location' do
        VCR.use_cassette('location_images') do
          result = subject.location_images(37.8267,-122.4233)

          expect(result).to be_a(Hash)
          expect(result).to have_key(:photo)
          expect(result[:photo]).to be_a(Array)
          expect(result[:photo][0]).to have_key(:title)
          expect(result[:photo][0]).to have_key(:url_o)
          expect(result[:photo][0][:url_o]).to be_a(String)
          expect(result[:photo][1]).to have_key(:title)
          expect(result[:photo][1]).to have_key(:url_o)
          expect(result[:photo][1][:url_o]).to be_a(String)
        end
      end
    end
  end
end
