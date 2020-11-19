class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  # before_action :set_profile

  def home
  end

  def index
  end

  def show
    if logged_in?
      @micropost  = current_user.microposts.build
      @micropost_feed_items = current_user.micropost_feed.page(params[:page]).per(20)
    end
  end

  def edit
  end

  private

  def logged_in?
    !current_user.nil?
  end


    # def set_profile
    #    @profile = current_user.profile
    # end

end
