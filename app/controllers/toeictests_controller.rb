class ToeictestsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy]
  before_filter :correct_user,   only: :destroy


def new
  @toeictest = Toeictest.new
 
  respond_to do |format|
    format.html  # new.html.erb
    format.json  { render :json => @toeictest }
  end
end

  def create
    @toeictest = current_user.toeictests.build(params[:toeictest])
    if @toeictest.save
      flash[:success] = "TOEIC test created!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @toeictest.destroy
    redirect_back_or root_path
  end

  private

    def correct_user
      @toeictest = current_user.toeictests.find_by_id(params[:id])
      redirect_to root_path if @toeictest.nil?
    end
end