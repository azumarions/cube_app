require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:user) { create(:user) }
  let(:micropost) { user.microposts.build(comment: "rails", user_id: user.id) }

  describe 'comment' do
    it 'should be valid' do
      expect(micropost).to be_valid
    end

    it 'should not be valid' do
      micropost.update_attributes(comment: "", picture: nil, user_id: user.id)
      expect(micropost).to be_invalid
    end

    it 'should not be at most 255 characters' do
      micropost.comment = "a" * 255
      expect(micropost).to be_valid
      micropost.comment = "a" * 256
      expect(micropost).to be_invalid
    end
  end

  describe 'user_id' do
    it 'should not be present' do
      micropost.user_id = nil
      expect(micropost).to be_invalid
    end
  end
end