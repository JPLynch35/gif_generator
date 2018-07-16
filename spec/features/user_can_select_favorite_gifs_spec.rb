require 'rails_helper'

describe 'a logged in user' do
  describe 'visiting /gifs' do
    before :each do
      @category1 = Category.create(title: 'dogs')
      @gif1 = @category1.gifs.create(gif_url: 'www.testurl.com/test1')
      @gif2 = @category1.gifs.create(gif_url: 'www.testurl.com/test2')
      @category2 = Category.create(title: 'cats')
      @gif3 = @category1.gifs.create(gif_url: 'www.testurl.com/test3')
      @gif4 = @category1.gifs.create(gif_url: 'www.testurl.com/test4')
    end
    it 'can select favorite gifs from gifs index page' do
      visit gifs_path
      check "gif_#{@gif4.id}"

      visit user_path()
      expect(page).to have_content(@category1.title)
      expect(page).to have_content(@gif1.gif_url)
      expect(page).to have_content(@gif2.gif_url)
      expect(page).to have_content(@category2.title)
      expect(page).to have_content(@gif3.gif_url)
      expect(page).to have_content(@gif4.gif_url)
    end
  end
end