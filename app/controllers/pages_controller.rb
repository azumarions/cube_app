class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  # before_action :set_profile

  def home
  end

  def index
    @users = User.all
    @users = User.page(params[:page]).per(2)
  end

  def show
  end

  private
    # def set_profile
    #    @profile = current_user.profile
    # end
end
