class StarsController < ApplicationController
  before_action :sign_in_required

  def create
    @article = Article.find(params[:article_id])
    unless @article.star?(current_user)
      @article.star(current_user)
      @micropost.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @article = Star.find(params[:id]).article
    if @article.star?(current_user)
      @article.unstar(current_user)
      @micropost.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
