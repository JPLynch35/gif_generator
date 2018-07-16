require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /' do
    it 'can create an account' do
      visit root_path
      click_on 'Create Account'

      expect(current_path).to eq(new_user_path)

      fill_in user[name], with: 'Paul'
      fill_in user[email], with: 'Paul@gmail.com'
      fill_in user[password], with: 'totallysecret'
      click_on 'Create Account'

      expect(current_path).to eq(user_path(User.where(email: 'Paul@gmail.com')))
    end
    it 'can create log in' do
      user1 = User.create(name: 'Dennis', email: 'Dennis@gmail.com', password: 'thisismypassword')
      fill_in user[email], with: user1.email
      fill_in user[password], with: user1.password
      click_on 'Log In'

      expect(current_path).to eq(user_path(User.where(email: 'Dennis@gmail.com')))
    end
  end
end
