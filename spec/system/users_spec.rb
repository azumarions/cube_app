require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }
  let(:edit_user) { create(:edit_user) }
  let(:profile) { create(:profile, description: 'hello') }

  describe 'signup' do
    it 'should not be valid' do
      visit new_user_registration_path
      fill_in 'user[username]', with: ''
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      fill_in 'user[password]', with: ''
      click_button 'commit'
      expect(current_path).to eq user_registration_path
    end

    it 'should be valid' do
      visit new_user_registration_path
      fill_in 'user[username]', with: user.username
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      fill_in 'user[password_confirmation]', with: user.password_confirmation
      click_button 'commit'
      expect(current_path).to eq user_registration_path
    end
  end

  describe 'signin' do
    it 'should not be valid' do
      visit new_user_session_path
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      click_button 'commit'
      expect(current_path).to eq new_user_session_path
      expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
    end

    it 'should be valid' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'commit'
      expect(current_path).to eq new_user_session_path
    end
  end

  describe 'edit' do
    before do
      user.confirm
      sign_in user
    end

    context 'user' do
      it 'account to user' do
        visit account_path
        click_link 'アカウント編集'
        expect(current_path).to eq edit_user_registration_path
      end

      it 'users from account edit is invalid' do
        visit edit_user_registration_path
        expect(page).to have_content 'アカウント設定'
        expect(page).to have_button '変更する'
        fill_in 'user[username]', with: ''
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation
        fill_in 'user[current_password]', with: user.password
        click_button '変更する'
        expect(current_path).to eq user_registration_path
        user.reload
        expect(user.username).to eq user.username
        expect(user.password).to eq user.password
      end
      
      it 'users from account edit is valid' do
        visit edit_user_registration_path
        fill_in 'user[username]', with: 'edit_user'
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation
        fill_in 'user[current_password]', with: user.password
        click_button '変更する'
        expect(current_path).to eq root_path
        user.reload
        visit edit_user_registration_path
        expect(user.username).to eq 'edit_user'
        expect(user.password).to eq user.password
      end

      it 'account cancel' do
        visit edit_user_registration_path
        expect(page).to have_link 'キャンセル'
        click_link 'キャンセル'
        expect(current_path).to eq account_path
      end

      it 'account delete' do
        visit edit_user_registration_path
        expect(page).to have_content 'アカウント削除'
        expect(page).to have_button 'アカウントを削除する'
      end
    end

    context 'description' do
      it 'account to description' do
        visit account_path
        click_link 'メッセージ編集'
        expect(current_path).to eq edit_account_description_path
      end

      it 'description from account' do
        visit edit_account_description_path
        expect(page).to have_content 'メッセージ設定'
        expect(page).to have_button '変更する'
      end

      it 'account cancel' do
        visit edit_account_description_path
        expect(page).to have_link 'キャンセル'
        click_link 'キャンセル'
        expect(current_path).to eq account_path
      end
    end
  end
end
