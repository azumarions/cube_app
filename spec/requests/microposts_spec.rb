require 'rails_helper'

RSpec.describe "Microposts", type: :request do
    let(:user) { create(:user) }
    let(:other_user) { create(:other_user) }

    def post_valid_information
        post microposts_path, params: { micropost: { comment: "aaa" } }
    end

    def post_invalid_information
        post microposts_path, params: { micropost: { comment: nil } }
    end

    def patch_valid_information
        patch microposts_path, params: { micropost: { comment: "bbb" } }
    end

    def patch_invalid_information
        patch microposts_path, params: { micropost: { comment: nil } }
    end

    describe 'post/micropost' do
        it 'does not add a micropost when not logged in' do
            expect{ post_valid_information }.not_to change(Micropost, :count)
            follow_redirect!
            expect(request.fullpath).to eq '/users/sign_in'
        end

        it 'does not add a micropost when the form has no information' do
            log_in_as(user)
            get microposts_index_path
            expect{ post_invalid_information }.not_to change(Micropost, :count)
        end

        xit 'succeeds to add a micropost' do
            log_in_as(user)
            get microposts_index_path
            expect(request.fullpath).to eq "/microposts/index"
            expect{ post_valid_information }.to change(Micropost, :count).by(1)
            follow_redirect!
            expect(request.fullpath).to eq "/microposts/index"
        end
    end

    describe 'delete/micropost' do
        it 'does not destroy a micropost when not logged in' do
            delete micropost_path(1)
            follow_redirect!
            expect(request.fullpath).to eq '/users/sign_in'
        end

        it 'does not destroy a micropost when other user logged in' do
            log_in_as(user)
            get microposts_index_path
            post_valid_information
            follow_redirect!
            delete destroy_user_session_path
            log_in_as(other_user)
            get microposts_index_path
            expect(request.fullpath).to eq "/microposts/index"
            post_valid_information
            expect{ delete micropost_path(1) }.not_to change(Micropost, :count)
            # expect{ delete micropost_path(2) }.to change(Micropost, :count)
        end

        xit "succeeds to destroy a micropost" do
            log_in_as(user)
            get microposts_index_path
            expect{ post_valid_information }.to change(Micropost.reload, :count).by(1)
            follow_redirect!
            expect{ delete micropost_path(1) }.to change(Micropost.reload, :count).by(-1)
            follow_redirect!
            expect(request.fullpath).to eq "/microposts/index"
            expect(flash[:success]).to be_truthy
        end
    end
end