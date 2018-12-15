require 'rails_helper'

describe 'a user' do
  describe 'visiting article show page' do
    it 'can click a link to edit article' do
      article_1 = Article.create(title: 'Title_1', body: 'Body_1')
      visit article_path(article_1)
      click_on 'Edit'

      expect(current_path).to eq(edit_article_path(article_1))
    end
  end
  describe 'visiting article edit page' do
    it 'can edit an exisiting article' do
      article_1 = Article.create(title: 'Title_1', body: 'Body_1')
      visit edit_article_path(article_1)

      fill_in 'article[title]', with: 'This is an updated article title!'
      click_on 'Update Article'

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content('This is an updated article title!')
      expect(page).to have_content(article_1.body)
    end
  end
end
