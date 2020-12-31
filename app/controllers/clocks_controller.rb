class ClocksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def new
    @clock = Clock.new
    @initial_value = "00:00:00:00"
  end

  def create
    @clock = current_user.clocks.build(clock_params)
    if @clock.save
      flash[:success] = "記録しました!"
      redirect_to clocks_path
    else
      redirect_to root_path
    end
  end

  def show
  end

  def rank
    @clocks = Clock.all.limit(30)
  end

  def index
    if logged_in?
      @clock  = current_user.clocks.build
      @clock_feed_items = current_user.clock_feed.page(params[:page]).per(20)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @clock.destroy
    flash[:success] = "記録を削除しました"
    redirect_to request.referrer || root_url
  end

  private

    def clock_params
      params.require(:clock).permit(:hour, :create_at)
    end

    def correct_user
      @clock = current_user.clocks.find_by(id: params[:id])
      redirect_to root_url if @clock.nil?
    end

    def logged_in?
      !current_user.nil?
    end
end
