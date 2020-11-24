require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }
  let(:active) { user.active_relationships.build(followed_id: other_user.id, follower_id: user.id) }

  subject { active }

  it { should be_valid }

  describe 'relationship' do
    context 'follower' do
      it { should respond_to(:follower) }
      it 'validation' do
        active.follower_id = nil
        expect(active).to be_invalid
      end

      it 'return following-user' do
        expect(active.follower).to eq user
      end
    end

    context 'followed' do
      it { should respond_to(:followed) }
      it 'validation' do 
        active.followed_id = nil
        expect(active).to be_invalid
      end

      it 'return followed-user' do
        expect(active.followed).to eq other_user
      end
    end
  end
end
