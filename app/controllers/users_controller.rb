class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :sign_in_required, only: [:show, :index, :following, :followers]

  def show
    @user = User.find(params[:id])
    if logged_in?
      @micropost  = @user.microposts.build
      @micropost_feed_items = @user.micropost_feed.page(params[:page]).per(20)
    end
  end

  def index
    @users = User.all
    @users = User.page(params[:page]).per(20)
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(20)
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(20)
    render 'show_follow'
  end

  private

  def logged_in?
    !current_user.nil?
  end
end
