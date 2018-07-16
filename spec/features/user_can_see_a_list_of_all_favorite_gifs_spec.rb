require 'rails_helper'

describe 'a logged-in user' do
  describe 'visiting /gifs' do
    before :each do
      @user1 = User.create(name: 'Bill', email: 'Bill@Bill.Bill', password: 'Bob')
      @category1 = Category.create(title: 'dogs')
      @gif1 = @category1.gifs.create(gif_url: 'www.testurl.com/test1')
      @gif2 = @category1.gifs.create(gif_url: 'www.testurl.com/test2')
      @category2 = Category.create(title: 'cats')
      @gif3 = @category2.gifs.create(gif_url: 'www.testurl.com/test3')
      @gif4 = @category2.gifs.create(gif_url: 'www.testurl.com/test4')
      visit login_path
      fill_in :email, with: @user1.email
      fill_in :password, with: @user1.password
      click_on 'Log In'
    end
    it 'can select favorite gifs from gifs index page' do
      visit gifs_path
      check "gif_#{@gif1.id}"
      check "gif_#{@gif4.id}"
      visit user_path(@user1)
      click_on 'Favorites'

      expect(page).to have_content(@category1.title)
      expect(page).to have_content(@gif1.gif_url)
      expect(page).to_not have_content(@gif2.gif_url)
      expect(page).to have_content(@category2.title)
      expect(page).to_not have_content(@gif3.gif_url)
      expect(page).to have_content(@gif4.gif_url)
    end
  end
end
