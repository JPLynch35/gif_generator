require 'rails_helper'

describe Favorite, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:gif_id)}
    it { should validate_presence_of(:user_id)}
  end
  describe 'relationships' do
    it { should belong_to(:user)}
    it { should belong_to(:gif)}
  end
  describe 'instance methods' do
    it 'should create favorites from an array' do
      user = User.create(name: 'bob', email: 'jack', password: 'jill')
      category1 = Category.create(title: 'dogs')
      gif1 = category1.gifs.create(gif_url: 'www.testurl.com/test1')
      gif2 = category1.gifs.create(gif_url: 'www.testurl.com/test2')
      gifs_list = [gif1.id, gif2.id]
      Favorite.create_favorites(gifs_list, user.id)

      expect(Favorite.first.gif_id).to eq(gif1.id)
      expect(Favorite.first.user_id).to eq(user.id)
      expect(Favorite.last.gif_id).to eq(gif2.id)
      expect(Favorite.last.user_id).to eq(user.id)
    end
  end
end
