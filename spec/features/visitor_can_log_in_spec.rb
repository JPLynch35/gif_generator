require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /' do
    it 'can create an account' do
      visit root_path
      within '.navbar' do
        click_on 'Register'
      end

      expect(current_path).to eq(new_user_path)

      fill_in 'user_name', with: 'Paul'
      fill_in 'user_email', with: 'Paul@gmail.com'
      fill_in 'user_password', with: 'totallysecret'
      click_on 'Create Account'

      expect(current_path).to eq(user_path(User.find_by(email: 'Paul@gmail.com').id))
    end
    it 'can not create an account without all information' do
      visit root_path
      within '.navbar' do
        click_on 'Register'
      end

      expect(current_path).to eq(new_user_path)

      fill_in 'user_name', with: ''
      fill_in 'user_email', with: 'Paul@gmail.com'
      fill_in 'user_password', with: 'totallysecret'
      click_on 'Create Account'

      expect(page).to have_content('Create an Account')
    end
    it 'can log in' do
      user1 = User.create(name: 'Dennis', email: 'Dennis@gmail.com', password: 'thisismypassword')
      visit login_path

      fill_in 'email', with: user1.email
      fill_in 'password', with: user1.password
      click_on 'Submit'
      
      expect(current_path).to eq(user_path(User.find_by(email: 'Dennis@gmail.com').id))
    end
    it 'can not log in with bad credentials' do
      user1 = User.create(name: 'Dennis', email: 'Dennis@gmail.com', password: 'thisismypassword')
      visit login_path

      fill_in 'email', with: user1.email
      fill_in 'password', with: 'badpassword'
      click_on 'Submit'
      
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      within('body') do
        expect(page).to have_content('Log In')
      end
    end
  end
end
