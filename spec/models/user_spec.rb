require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email)}
  end
  describe 'relationships' do
    it { should have_many(:favorites)}
    it { should have_many(:gifs).through(:favorites)}
  end
end
