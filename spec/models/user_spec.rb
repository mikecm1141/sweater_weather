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
end
