require 'rails_helper'

describe 'a vistor' do
  context 'who is not logged in' do
    it 'can not see other users favorite pages' do
      user = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass')
      visit user_favorites_path(user)

      expect(page).to have_content("Log in to see other user's favorites!")
    end
  end
  context 'who is logged in as a default user' do
    it 'can see other users favorite pages' do
      user1 = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass')
      user2 = User.create(name: 'Joe', email: 'Joe@Joe.com', password: 'pass')
      allow_any_instance_of(ApplicationController).to recieve(:current_user).and_return(user1)
      visit user_favorites_path(user2)

      expect(page).to have_content("Hey #{user1.name}, welcome to #{user2.name}'s favorite page!")
    end
  end
  context 'who is logged in as an admin' do
    it 'can see other users favorite pages' do
      user1 = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass', role: 1)
      user2 = User.create(name: 'Joe', email: 'Joe@Joe.com', password: 'pass')
      allow_any_instance_of(ApplicationController).to recieve(:current_user).and_return(user1)
      visit user_favorites_path(user2)

      expect(page).to have_content("Hey #{user1.name}, welcome to #{user2.name}'s favorite page!")
    end
  end
end