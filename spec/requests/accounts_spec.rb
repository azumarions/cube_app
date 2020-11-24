require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  let(:user) { create(:user)}

  before do
    user.confirm
    sign_in user
  end

  it 'return response 200' do
    get account_path
    expect(response.status).to eq 200   
  end

  describe 'name' do
    it 'return response 200' do
      get edit_account_name_path
      expect(response.status).to eq 200
    end
  end

  describe 'description' do
    it 'return response 200' do
      get edit_account_description_path
      expect(response.status).to eq 200
    end
  end
end
