require 'rails_helper'

describe 'a logged-in user' do
  describe 'visiting /users/:id/favorites' do
    before :each do
      @user1 = User.create(name: 'Bill', email: 'Bill@Bill.Bill', password: 'Bob')
      @category1 = Category.create(title: 'dogs')
      @gif1 = @category1.gifs.create(gif_url: 'www.testurl.com/test1')
      @gif2 = @category1.gifs.create(gif_url: 'www.testurl.com/test2')
      @category2 = Category.create(title: 'cats')
      @gif3 = @category2.gifs.create(gif_url: 'www.testurl.com/test3')
      @gif4 = @category2.gifs.create(gif_url: 'www.testurl.com/test4')
      @favorite1 = Favorite.create(user_id: @user1.id, gif_id: @gif1.id)
      @favorite1 = Favorite.create(user_id: @user1.id, gif_id: @gif3.id)
    end
    it 'should see a list of all favorited gifs' do
      visit user_path(@user1)
      click_on 'Favorites'

      expect(current_path).to eq(user_favorites_path(@user1))
      expect(page).to have_content(@category1.title)
      expect(page).to have_content(@gif1.gif_url)
      expect(page).to_not have_content(@gif2.gif_url)
      expect(page).to have_content(@category2.title)
      expect(page).to have_content(@gif3.gif_url)
      expect(page).to_not have_content(@gif4.gif_url)
    end
  end
end
