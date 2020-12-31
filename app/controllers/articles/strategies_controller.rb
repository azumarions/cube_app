class Articles::StrategiesController < ApplicationController
  before_action :sign_in_required
  before_action :authenticate_user!
  before_action :correct_user,   only: :destroy

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "作成完了!"
      redirect_to article_strategies_path
    else
      @feed_items = current_user.feed.page(params[:page]).per(20)
      redirect_to article_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
    @articles = Article.page(params[:page]).per(20)
    @search = Article.ransack(params[:q])
    @articles = @search.result(distinct: true).page(params[:page]).per(20)
  end

  def edit
    @article = current_user.articles.find_by(id: params[:id]) || nil
    if @article.nil?
      flash[:success] = "編集権限がありません"
      redirect_to articles_index_path
    end
  end

  def update
    @article = current_user.articles.find_by(id: params[:id])
    @article.update_attributes(article_params)
    if @article.save
      flash[:success] = "編集が完了しました"
      redirect_to articles_index_path
    else
      render article_path
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "記事を削除しました"
    redirect_to request.referrer || root_url
  end

  private

    def article_params
      params.require(:article).permit(:title, :content, :picture)
    end

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to root_url if @article.nil?
    end
end
