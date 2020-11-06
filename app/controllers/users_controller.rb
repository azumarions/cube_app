class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @users = User.page(params[:page]).per(2)
  end
end
