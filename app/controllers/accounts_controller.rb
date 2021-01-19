class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @guest_user = User.guest
  end
end
