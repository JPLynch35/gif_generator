require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:role)}
  end
  describe 'relationships' do
    it { should have_many(:favorites)}
    it { should have_many(:gifs).through(:favorites)}
  end
  describe 'class methods' do
    it 'should authenticate a valid user' do
      user = User.create(name: 'Dennis', email: 'Dennis@gmail.com', password: 'thisismypassword')

      attempt1 = user.authenticate('wrongpassword')

      expect(attempt1).to be false

      attempt2 = user.authenticate(user.password)

      expect(attempt2).to eq(user)
    end
  end
  describe 'roles' do
    it 'can be created as an admin' do
      user = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass', role: 1)

      expect(user.role).to eq('admin')
      expect(user.admin?).to be_truthy
    end
    it 'can be created as a default user' do
      user = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
  end
end
