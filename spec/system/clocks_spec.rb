require 'rails_helper'

RSpec.describe "Clocks", type: :system do
  let(:user) { create(:user) }

  before do
    user.confirm
    sign_in user
  end

  describe 'create' do
    it 'should be sending and save the time to index' do
      visit new_clock_path
      expect(page).to have_button 'タイムを記録する'
      click_button 'タイムを記録する'
      expect(current_path).to eq clocks_path
      visit clocks_path
      expect(page).to have_content '00:00:00:00'
    end
  end
end
