require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:micropost) { create(:micropost) }
  let(:like) { create(:like, user_id: user.id, micropost_id: micropost.id) }

  describe 'like' do
    it 'needs user_id' do
      like.user_id = nil
      expect(like).to be_invalid
    end

    it 'needs micropost_id' do
      like.micropost_id = nil
      expect(like).to be_invalid
    end
  end
end
