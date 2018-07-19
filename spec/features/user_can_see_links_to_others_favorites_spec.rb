require 'rails_helper'

describe 'a site visitor' do
  before :each do
    category1 = Category.create(title: 'dogs')
    gif1 = category1.gifs.create(gif_url: 'www.testurl.com/test1')
    gif2 = category1.gifs.create(gif_url: 'www.testurl.com/test2')
    category2 = Category.create(title: 'cats')
    gif3 = category2.gifs.create(gif_url: 'www.testurl.com/test3')
    gif4 = category2.gifs.create(gif_url: 'www.testurl.com/test4')
    user1 = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass')
    user2 = User.create(name: 'Joe', email: 'Joe@Joe.com', password: 'pass')
    user3 = User.create(name: 'Ben', email: 'Ben@Ben.com', password: 'pass', role: 1)
    fav1 = Favorite.create(gif_id: @gif3.id, user_id: @user1.id)
    fav2 = Favorite.create(gif_id: @gif4.id, user_id: @user1.id)
    fav3 = Favorite.create(gif_id: @gif1.id, user_id: @user2.id)
    fav4 = Favorite.create(gif_id: @gif4.id, user_id: @user2.id)
    fav5 = Favorite.create(gif_id: @gif2.id, user_id: @user3.id)
    fav6 = Favorite.create(gif_id: @gif3.id, user_id: @user3.id)
  end
  context 'who is not logged in' do
    it 'can not see anything on other users show pages' do
      visit user_path(user1)
      
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
  context 'who is logged in as a default user' do
    it 'can navigate with the navbar to certain user pages' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit user_path(user1)
      
      expect(page).to have_content("See what other user's favorited!")
      expect(page).to have_content("Check out #{user2.name}'s page'")
      expect(page).to have_content("Check out #{user3.name}'s page'")

      click_on "#{user2.name}'s' page"
      expect(current_path).to eq(user_path(user2))
    end
  end
  context 'who is logged in as an admin' do
    it 'can navigate with the navbar to certain user pages' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user3)

      visit user_path(user3)
      
      expect(page).to have_content("See what other user's favorited!")
      expect(page).to have_content("Check out #{user1.name}'s page'")
      expect(page).to have_content("Check out #{user2.name}'s page'")

      click_on "#{user1.name}'s' page"
      expect(current_path).to eq(user_path(user1))
    end
  end
end