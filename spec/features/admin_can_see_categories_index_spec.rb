require 'rails_helper'

describe 'user visiting category index page' do
  context 'as an admin' do
    it 'allows admin to see all categories' do
      admin = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content('All Categories (Admins Only)')
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