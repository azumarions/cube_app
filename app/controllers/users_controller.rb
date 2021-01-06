class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :sign_in_required, only: [:show, :index, :following, :followers]

  def show
    @user = User.find(params[:id])
    @micropost  = @user.microposts.build
    @micropost_feed_items = @user.micropost_feed.page(params[:page]).per(20)
    @clock_feed_items = @user.clock_feed.limit(1)
  end

  def index
    @users = User.all
    @users = User.page(params[:page]).per(20)
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(20)
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(20)
    @search = User.ransack(params[:q])
    @users_search = @search.result(distinct: true).page(params[:page]).per(20)
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(20)
    @search = User.ransack(params[:q])
    @users_search = @search.result(distinct: true).page(params[:page]).per(20)
    render 'show_follow'
  end
end
