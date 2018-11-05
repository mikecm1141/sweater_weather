require 'rails_helper'

describe User, type: :model do
  context 'Validations' do
    it { should validate_presence_of   :email }
    it { should validate_uniqueness_of :email }
  it { should validate_presence_of   :password }
  end

  context 'Relationships' do
    it { should have_many :favorites }
  end

  context 'Instance Methods' do
    context '#remove_favorite_location(location)' do
      it 'removes the inputted location from favorites' do
        user = create(:user)
        user.favorites.create(location: 'Denver, CO')
        user.favorites.create(location: 'Honolulu, HI')

        expect(user.favorites.size).to eq(2)

        user.remove_favorite_location('Denver, CO')

        expect(user.favorites.size).to eq(1)
      end
    end
  end
end
