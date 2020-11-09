class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show, :index, :following, :followers]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @users = User.page(params[:page]).per(2)
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(2)
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(2)
    render 'show_follow'
  end
end
