class MicropostsController < ApplicationController
  before_action :sign_in_required, only: [:create, :show, :index, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿完了!"
      redirect_to microposts_index_path
    else
      render root_path
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def index
    @microposts = Micropost.all
    @microposts = Micropost.page(params[:page]).per(5)
  end

  def destroy
    @micropost.destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.permit(:comment, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
