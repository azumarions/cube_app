require 'rails_helper'

RSpec.describe "UserAuthentications", type: :request do
    let(:user) { create(:user) }
    let(:user_params) { attributes_for(:user) }
    let(:invalid_user_params) { attributes_for(:user, name: "") }
  
    describe 'POST #create' do
      before do
        ActionMailer::Base.deliveries.clear
      end
      context 'パラメータが妥当な場合' do
        it 'リクエストが成功すること' do
          post user_registration_path, params: { user: user_params }
          expect(response.status).to eq 302
        end
  
        it '認証メールが送信されること' do
          post user_registration_path, params: { user: user_params }
          expect(ActionMailer::Base.deliveries.size).to eq 1
        end
  
        it 'createが成功すること' do
          expect do
            post user_registration_path, params: { user: user_params }
          end.to change(User, :count).by 1
        end
  
        it 'リダイレクトされること' do
          post user_registration_path, params: { user: user_params }
          expect(response).to redirect_to root_url
        end
      end
    end

    describe 'GET #edit' do
      subject { get edit_user_registration_path }
      context 'ログインしている場合' do
        before do
            user.confirm
            sign_in user
        end
        it 'リクエストが成功すること' do
            is_expected.to eq 200
        end
      end
      context 'ゲストの場合' do
        it 'リダイレクトされること' do
            is_expected.to redirect_to new_user_session_path
        end
      end
    end
end
  