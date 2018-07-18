require 'rails_helper'

describe 'a visitor' do
  context 'logged in as a default user' do
    it 'can see the names of other users that they match favorites with' do
      category1 = Category.create(title: 'dogs')
      gif1 = category1.gifs.create(gif_url: 'www.testurl.com/test1')
      gif2 = category1.gifs.create(gif_url: 'www.testurl.com/test2')
      category2 = Category.create(title: 'cats')
      gif3 = category2.gifs.create(gif_url: 'www.testurl.com/test3')
      gif4 = category2.gifs.create(gif_url: 'www.testurl.com/test4')
      user1 = User.create(name: 'Dennis', email: 'Dennis@gmail.com', password: 'thisismypassword1')
      user2 = User.create(name: 'Jane', email: 'Jane@gmail.com', password: 'thisismypassword2')
      gif1.favorites.create(user: user1)
      gif2.favorites.create(user: user1)
      gif4.favorites.create(user: user1)
      gif1.favorites.create(user: user2)
      gif2.favorites.create(user: user2)
      gif4.favorites.create(user: user2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit user_favorites_path(user1)

      expect(page).to have_content("You have the same taste as #{user2.name}, go check out their favorites page!")
    end
  end
end
