class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  # before_action :set_profile

  def home
  end

  def index
  end

  def show
      @micropost  = current_user.microposts.build
      @micropost_feed_items = current_user.micropost_feed.page(params[:page]).per(20)
      @clock_feed_items = current_user.clock_feed.limit(1)
  end

  def edit
  end

  def contact
  end

  private

  #  def set_profile
     #  @profile = current_user.profile.avatar
  #  end

end
