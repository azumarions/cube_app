class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :sign_in_required

  def create
    @micropost = Micropost.find(params[:micropost_id])
    unless @micropost.like?(current_user)
      @micropost.like(current_user)
      @micropost.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @micropost = Like.find(id: params[:id]).micropost
    if @micropost.like?(current_user)
      @micropost.unlike(current_user)
      @micropost.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
