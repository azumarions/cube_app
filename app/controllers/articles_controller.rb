class ArticlesController < ApplicationController
  before_action :sign_in_required
  before_action :authenticate_user!

  def show
  end

  def index
      @article  = current_user.articles.build
      @feed_items = current_user.feed.page(params[:page]).per(20)
      @search = Article.ransack(params[:q])
      @articles = @search.result(distinct: true).page(params[:page]).per(20)
    end
end
