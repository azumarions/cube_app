require 'rails_helper'

RSpec.describe "Articles", type: :system do
  let(:user) { create(:user) }

  before do
    user.confirm
    sign_in user
  end

  describe 'to create' do
    it 'should be valid' do
      visit new_article_strategy_path
      expect(page).to have_content '新規投稿'
      expect(page).to have_button '投稿する'
      fill_in 'article[title]', with: 'title'
      fill_in 'article[content]', with: 'content'
      click_button '投稿する'
      expect(current_path).to eq article_strategies_path
    end

    it 'to cancel should be valid' do
      visit new_article_strategy_path
      expect(page).to have_link 'キャンセル'
      click_link 'キャンセル'
      expect(current_path).to eq article_strategies_path
    end
  end
end
