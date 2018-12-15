require 'rails_helper'

describe 'a user' do
  describe 'visits articles index page' do
    before :each do
      @article_1 = Article.create(title: 'Title_1', body: 'Body_1')
      @article_2 = Article.create(title: 'Title_2', body: 'Body_2')
    end
    it 'sees all articles' do
      visit articles_path

      expect(page).to have_link(@article_1.title)
      expect(page).to have_link(@article_2.title)
    end
    it 'sees a link to create a new article' do
      visit articles_path

      expect(page).to have_link('Create a New Article')
    end
  end
end
