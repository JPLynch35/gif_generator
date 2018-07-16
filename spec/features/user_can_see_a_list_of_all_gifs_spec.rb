require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /gifs' do
    before :each do
      @category1 = Category.create(title: 'dogs')
      @gif1 = @category1.gifs.create(gif_url: 'www.testurl.com/test1')
      @gif2 = @category1.gifs.create(gif_url: 'www.testurl.com/test2')
      @category2 = Category.create(title: 'cats')
      @gif3 = @category1.gifs.create(gif_url: 'www.testurl.com/test3')
      @gif4 = @category1.gifs.create(gif_url: 'www.testurl.com/test4')
    end
    it 'should see a list of all gifs sorted by category' do
      visit gifs_path

      expect(page).to have_content(@category1.title)
      expect(page).to have_content(@gif1.gif_url)
      expect(page).to have_content(@gif2.gif_url)
      expect(page).to have_content(@category2.title)
      expect(page).to have_content(@gif3.gif_url)
      expect(page).to have_content(@gif4.gif_url)
    end
  end
end