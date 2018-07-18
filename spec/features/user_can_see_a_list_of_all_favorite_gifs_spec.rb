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
      click_on 'Submit'
    end
    it 'can select favorite gifs from gifs index page' do
      visit gifs_path

      within("#gif-#{@gif1.id}") do
        check 'favorites_'
      end
      within("#gif-#{@gif3.id}") do
        check 'favorites_'
      end
      click_on 'Save Favorites'

      expect(page).to have_content(@category1.title.capitalize)
      expect(page).to have_content(@category2.title.capitalize)
    end
    it 'will not change favorites without any favorite selection' do
      visit gifs_path

      click_on 'Save Favorites'

      expect(page).to have_content('All Gifs')
    end
    it 'can remove gifs from favorites page' do
      fav1 = Favorite.create(gif_id: @gif3.id, user_id: @user1.id)
      fav2 = Favorite.create(gif_id: @gif4.id, user_id: @user1.id)
      visit user_favorites_path(@user1)

      expect(page).to have_content(@gif3.category.title.capitalize)
      
      within("#f-gif-#{fav1.id}") do
        click_on 'Remove'
      end
      within("#f-gif-#{fav2.id}") do
        click_on 'Remove'
      end

      expect(page).to_not have_content(@gif3.category.title)
    end
  end
end
