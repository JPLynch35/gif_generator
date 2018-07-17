require 'rails_helper'

describe 'user visiting category index page' do
  context 'as an admin' do
    before (:each) do
      @admin = User.create(name: 'Jenny', email: 'Jenny@jenny.com', password: 'pass', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it 'allows admin to see all categories' do
      visit admin_categories_path

      expect(page).to have_content('All Categories (Admins Only)')
    end
    it 'allows admin to delete a category and all gifs associated with it' do
      category1 = Category.create(title: 'dogs')
      gif1 = category1.gifs.create(gif_url: 'www.testurl.com/test1')
      gif2 = category1.gifs.create(gif_url: 'www.testurl.com/test2')
      category2 = Category.create(title: 'cats')
      gif3 = category2.gifs.create(gif_url: 'www.testurl.com/test3')
      gif4 = category2.gifs.create(gif_url: 'www.testurl.com/test4')

      visit admin_categories_path
      within("#category-#{category1.id}") do
        click_on 'Remove'
      end

      expect(page).to_not have_content(category1.title)
      expect(page).to have_content(category2.title)
      expect(gif1).to be_nil
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
