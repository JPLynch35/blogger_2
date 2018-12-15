require 'rails_helper'

describe 'a user' do
  describe 'visits articles index page' do
    it 'sees all articles' do
      article_1 = Article.create(title: 'Title_1', body: 'Body_1')
      article_2 = Article.create(title: 'Title_2', body: 'Body_2')

      visit articles_path

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_2.title)
    end
  end
end
