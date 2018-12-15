require 'rails_helper'

describe 'a user' do
  describe 'visiting article new page' do
    it 'can create a new artile' do
      expect(Article.count).to eq(0)

      visit articles_path
      click_on 'Create a New Article'

      expect(current_path).to eq(new_article_path)
      
      fill_in 'article[title]', with: 'New Title!'
      fill_in 'article[body]', with: 'New Body!'
      click_on 'Create Article'

      expect(current_path).to eq(article_path(Article.last))
      expect(Article.count).to eq(1)
      expect(page).to have_content('New Title!')
      expect(page).to have_content('New Body!')
    end
  end
end
