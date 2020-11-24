require 'rails_helper'

RSpec.describe "Clocks", type: :request do
  let(:user) { create(:user) }
  let(:clock_params) { attributes_for(:clock) }
  let(:invalid_clock_params) { attributes_for(:clock, hour: '') }

  before do
    user.confirm
    sign_in user
  end

  describe "GET /clocks" do
    it 'get index should be success' do
      get clocks_path
      expect(response.status).to eq 200
    end

    it 'get rank should be success' do
      get clocks_rank_path
      expect(response.status).to eq 200
    end

    it 'get new should be success' do
      get new_clock_path
      expect(response.status).to eq 200
    end
  end

  describe 'post/clocks' do
    context 'valid' do
      it 'response is 302' do
        post clocks_path, params: { clock: clock_params }
        expect(response.status).to eq 302
      end

      it 'request path is valid' do
        get clocks_path
        expect(request.fullpath).to eq "/clocks"
      end

      it 'clock count is success' do
        expect do
          post clocks_path, params: { clock: clock_params }
        end.to change(Clock, :count).by(1)
        follow_redirect!
        expect(request.fullpath).to eq "/clocks"
      end
    end

    context 'invalid' do
      it 'response is valid' do
        post clocks_path, params: { clock: invalid_clock_params }
        expect(response.status).to eq 302
      end

      it 'ユーザーが登録されること' do
        expect do
          post clocks_path, params: { clock: invalid_clock_params }
        end.not_to change(Clock, :count)
        follow_redirect!
        expect(request.fullpath).to eq "/"
      end
    end
  end

  describe 'delete/clocks' do
    it 'does not destroy a clock' do
      delete clock_path(1)
      expect(response.status).to eq 302
      follow_redirect!
      expect(request.fullpath).to eq '/'
   end

    it 'clock count is not change' do
      expect do
        delete clock_path(1), params: { clock: clock_params }
      end.not_to change(Clock, :count)
    end
  end
end
