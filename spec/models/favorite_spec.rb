require 'rails_helper'

describe Favorite, type: :model do
  context 'Relationships' do
    it { should belong_to :user }
  end

  context 'Validations' do
    it { should validate_presence_of :location }
  end
end
