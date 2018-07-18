require 'rails_helper'

describe 'a site visitor' do
  before :each do
    category1 = Category.create(title: 'dogs')
    gif1 = category1.gifs.create(gif_url: 'www.testurl.com/test1')
    gif2 = category1.gifs.create(gif_url: 'www.testurl.com/test2')
    category2 = Category.create(title: 'cats')
    gif3 = category2.gifs.create(gif_url: 'www.testurl.com/test3')
    gif4 = category2.gifs.create(gif_url: 'www.testurl.com/test4')
  end
  context 'who is not logged in' do
    it 'can navigate with the navbar certain visitor pages' do
      visit root_path
      within '.navbar' do
        click_on 'All Gifs'
      end
      expect(current_path).to eq(gifs_path)

      within '.navbar' do
        click_on 'Dashboard'
      end
      expect(current_path).to eq(root_path)
      expect(page).to_not have_content('Favorites')
      expect(page).to_not have_content('Add  Gifs')
      expect(page).to_not have_content('Remove Categories')

      within '.navbar' do
        click_on 'Log In'
      end
      expect(current_path).to eq(login_path)
    end
  end
  context 'who is logged in as a default user' do
    it 'can navigate with the navbar to certain user pages' do
      user = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      within '.navbar' do
        click_on 'Favorites'
      end
      expect(current_path).to eq(user_favorites_path(user))
      expect(page).to_not have_content('Add  Gifs')
      expect(page).to_not have_content('Remove Categories')

      within '.navbar' do
        click_on 'Log Out'
      end
      expect(current_path).to eq(root_path)
    end
  end
  context 'who is logged in as an admin' do
    it 'can navigate with the navbar to certain user pages' do
      admin = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit root_path
      within '.navbar' do
        click_on 'Add Gifs'
      end
      expect(current_path).to eq(new_admin_category_path)

      within '.navbar' do
        click_on 'Remove Categories'
      end
      expect(current_path).to eq(admin_categories_path)
    end
  end
end