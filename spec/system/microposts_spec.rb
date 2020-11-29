require 'rails_helper'

RSpec.describe "Microposts", type: :system do
  let(:user) { create(:user) }

  before do
    user.confirm
    sign_in user
  end

  describe 'create micropost' do
    it 'should be valid' do
      visit new_micropost_path
      expect(page).to have_content '新規投稿'
      expect(page).to have_button '投稿する'
      expect(page).to have_link 'キャンセル'
      click_link 'キャンセル'
      expect(current_path).to eq root_path
    end
  end
end
