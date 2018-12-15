require 'rails_helper'

describe 'a user' do
  describe 'visiting article show page' do
    before :each do
      @article_1 = Article.create(title: 'Title_1', body: 'Body_1')
      @article_2 = Article.create(title: 'Title_2', body: 'Body_2')
    end
    it 'sees a single article page' do
      visit article_path(@article_1)

      expect(page).to have_content(@article_1.title)
      expect(page).to_not have_content(@article_2.title)
    end
  end
end
