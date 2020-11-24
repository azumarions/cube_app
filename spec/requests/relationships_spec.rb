require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }
  let(:relationship) { create(:relationship, followed_id: other_user.id, follower_id: user.id) }
  let(:post_request) { post relationships_path }
  let(:delete_request) { delete relationship_path(other_user) }

  before do
    user.confirm
    sign_in user
  end

  describe 'following and followed', :js => true do
    context "post /create" do
      it 'is not valid when logged in' do
        subject do
          post relationships_path, params: { followed_id: other_user.id }, xhr: true
        end

        expect { subject }.to change(Relationship, :count).by(0)
      end
    end

    context 'delete /destroy' do
      it 'is not valid when logged in' do
        subject do
          delete relationship_path, params: { follower_id: user.id }, xhr: true
        end

        expect{ subject }.to change(Relationship, :count).by(0)
      end
    end
  end
end
