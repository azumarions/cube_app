class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  # before_action :set_profile

  def home
  end

  def index
  end

  def show
  end

  private
    # def set_profile
    #    @profile = current_user.profile
    # end
end
