class ArticlesController < ApplicationController
  before_action :sign_in_required
  before_action :authenticate_user!

  def show
  end

  def index
    if logged_in?
      @article  = current_user.articles.build
      @feed_items = current_user.feed.page(params[:page]).per(20)
    end
  end

  private

    def logged_in?
      !current_user.nil?
    end
end
