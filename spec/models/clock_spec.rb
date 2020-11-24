require 'rails_helper'

RSpec.describe Clock, type: :model do
  let(:user) { create(:user) }
  let(:clock) { create(:clock, hour: "00:00:00:00", user_id: user.id)}

  describe 'user_id' do
    it 'should not be valid' do
      clock.user_id = nil
      expect(clock).to be_invalid
    end

    it 'should be valid' do
      clock.user_id = user.id
      expect(clock).to be_valid
    end
  end

  describe 'hour' do
    it 'should not be valid' do
      clock.hour = nil
      expect(clock).to be_invalid
    end

    it 'should be valid' do
      clock.hour = "00:00:00:00"
      expect(clock).to be_valid
    end
  end
end
