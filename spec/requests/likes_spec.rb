require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let(:user) { create(:user) }
  let(:micropost) { create(:micropost) }
  let(:like) { create(:like, user_id: user.id, micropost_id: micropost.id) }

  describe 'json test', :js => true do
    before do
      user.confirm
      sign_in user
    end
    
    context 'post/create' do
      subject do
        post likes_path, params: { micropost_id: micropost.id, id: like.id }, xhr: true
      end

      it 'add a new like to the micropost' do
        expect { subject }.to change(Like, :count).by(1)
      end

      it '200が返ってくる' do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end
