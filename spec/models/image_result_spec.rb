require 'rails_helper'

describe ImageResult do
  subject { ImageResult.new('denver,co') }

  it 'exists' do
    expect(subject).to be_a(ImageResult)
  end

  context 'Instance Methods' do
    context '#random_image_url' do
      it 'returns a random image url' do
        VCR.use_cassette('random_image') do
          expect(subject.random_image_url).to be_a(String)
        end
      end
    end

    context '#location_string' do
      it 'returns location as formatted string' do
        VCR.use_cassette('random_image') do
          expect(subject.location_string).to eq('Denver, CO')
        end
      end
    end
  end
end
