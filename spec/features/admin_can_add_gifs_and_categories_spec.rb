require 'rails_helper'

describe 'user visiting new gif page' do
  context 'as an admin' do
    before :each do
      @admin = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it 'allows admin to add gifs' do
      visit login_path
      fill_in :email, with: 'Jenny@jenny.com'
      fill_in :password, with: 'pass'
      click_on 'Submit'

      visit new_admin_category_path
      
      expect(page).to have_content('Add Gifs (Admins Only)')
      fill_in :title, with: 'pig'
      click_on 'Generate Gif'

      expect(current_path).to eq(gifs_path)
      expect(page).to have_content('Pig')
    end
  end
  context 'as a default user' do
    it 'does not allow a default user to see all categories' do
      user = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass', role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end