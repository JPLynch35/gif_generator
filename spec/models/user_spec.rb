require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_presence_of(:name)}
  end
  describe 'relationships' do
    it { should have_many(:favorites)}
    it { should have_many(:gifs).through(:favorites)}
  end
  describe 'class methods' do
    it 'should authenticate a valid user' do
      user = User.create(name: 'Dennis', email: 'Dennis@gmail.com', password: 'thisismypassword')

      attempt1 = user.authenticate(user.email, 'thisisnotmypassword')

      expect(attempt1).to eq(nil)

      attempt2 = user.authenticate(user.email, 'thisismypassword')

      expect(attempt2).to eq(user)
    end
  end
end
