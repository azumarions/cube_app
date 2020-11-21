require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user' do
    let(:user) { create(:user) }

    it 'should be valid' do
      expect(user).to be_valid
    end

    context 'name' do
      it 'gives presence' do
        user.username = " "
        expect(user).to be_invalid
      end

      it 'is not too long' do
        user.username = "a" * 50
        expect(user).to be_valid
      end

      it 'is too long' do
        user.username = "a" * 51
        expect(user).to be_invalid
      end
    end

    context 'email' do
      it 'gives presence' do
        user.email = " "
        expect(user).to be_invalid
      end

      it 'is not too long' do
        user.email = "a" * 243 + "@example.com"
        expect(user).to be_valid
      end

      it 'is too long' do
        user.email = "a" * 244 + "@example.com"
        expect(user).to be_invalid
      end
    end

    context 'password' do
      it 'should be present' do
        user.password = user.password_confirmation = " " * 6
        expect(user).to be_invalid
      end

      it 'is too short' do
        user.password = user.password_confirmation = "a" * 5
        expect(user).to be_invalid

      end

      it 'is not too short' do
        user.password = user.password_confirmation = "a" * 6
        expect(user).to be_valid
      end
    end

    context 'microposts' do
      it 'should be destroy if user delete' do
        user.microposts.create!(comment: "rails")
        expect{ user.destroy }.to change{ Micropost.count }.by(-1)
      end
    end
  end
end
