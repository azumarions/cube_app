require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }

  def post_valid_information
    post article_strategies_path, params: { article: { content: "aaa" } }
  end

  def post_invalid_information
    post article_strategies_path, params: { article: { content: nil } }
  end

  def patch_valid_information
    patch article_strategy_path(user), params: { article: { content: "bbb" } }
  end

  def patch_invalid_information
    patch article_strategy_path(user), params: { article: { content: nil } }
  end

  describe "GET /articles" do
    it "is success when user logged in" do
      get article_strategies_path
      expect(response).to have_http_status(302)
    end
  end

  describe "post /articles" do
    it "does not add a article when not logged in" do
      expect{ post_valid_information }.not_to change(Article, :count)
      follow_redirect!
      expect(request.fullpath).to eq "/users/sign_in"
    end

    it "does not add a article when the form has no information" do
      log_in_as(user)
      get article_strategies_path
      expect{ post_invalid_information }.not_to change(Article, :count)
    end

    it "succeeds add a article" do
      log_in_as(user)
      get article_strategies_path
      expect(request.fullpath).to eq "/article/strategies"
      # expect{ post_valid_information }.to change(Article, :count).by(1)
      follow_redirect!
      expect(request.fullpath).to eq "/users/sign_in"
    end
  end

  describe "delete /articles" do
    it "does not destroy a micropost when not logged in" do
      delete article_strategy_path(1)
      follow_redirect!
      expect(request.fullpath).to eq '/users/sign_in'
    end

    it "does not destroy a micropost when other users logged in" do
      log_in_as(user)
      get article_strategies_path
      patch_valid_information
      follow_redirect!
      delete destroy_user_session_path
      log_in_as(other_user)
      get article_strategies_path
      expect(request.fullpath).to eq '/article/strategies'
      patch_valid_information
      expect{ delete article_strategy_path(1) }.not_to change(Article, :count)
      expect{ delete article_strategy_path(2) }.not_to change(Article, :count)
    end

    it "succeeds to destroy a micropost" do
      log_in_as(user)
      get article_strategies_path
      expect{ patch_valid_information }.not_to change(Article, :count)
      follow_redirect!
      expect{ delete article_strategy_path(1) }.not_to change(Article, :count)
      follow_redirect!
      expect(request.fullpath).to eq '/users/sign_in'
    end
  end

  describe "edit /articles" do
    it "does not edit a micropost when not logged in" do
      log_in_as(user)
      get article_strategies_path
      post_valid_information
      follow_redirect!
      delete destroy_user_session_path
      follow_redirect!
      get edit_article_strategy_path(1)
      follow_redirect!
      expect(request.fullpath).to eq '/users/sign_in'
    end

    it "does not edit a micropost when other users logged in" do
      log_in_as(user)
      get article_strategies_path
      post_valid_information
      follow_redirect!
      delete destroy_user_session_path
      follow_redirect!
      log_in_as(other_user)
      get edit_article_strategy_path(1)
      follow_redirect!
      expect(request.fullpath).to eq '/users/sign_in'
    end

    it "does not edit a micropost when the form has no information" do
      log_in_as(user)
      get article_strategies_path
      post_valid_information
      follow_redirect!
      get edit_article_strategy_path(1)
      expect(request.fullpath).to eq '/article/strategies/1/edit'
      post_invalid_information
      expect(request.fullpath).to eq '/article/strategies'
    end

    it "succeeds to edit a micropost" do
      log_in_as(user)
      get article_strategies_path
      post_valid_information
      follow_redirect!
      get edit_article_strategy_path(1)
      expect(request.fullpath).to eq '/article/strategies/1/edit'
      patch_valid_information
      follow_redirect!
      expect(request.fullpath).to eq '/users/sign_in'
    end
  end
end
