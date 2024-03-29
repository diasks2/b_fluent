# -*- encoding : utf-8 -*-
class ToeictestsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy, :toeicjournal]
  before_filter :correct_user,   only: :destroy

def toeicjournal
  @toeictests = current_user.toeictests.paginate(page: params[:page]) if signed_in?
end

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
      flash[:success] = "TOEIC® test created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @toeictest.destroy
    redirect_back_or current_user
  end

  private

    def correct_user
      @toeictest = current_user.toeictests.find_by_id(params[:id])
      redirect_to root_path if @toeictest.nil?
    end
end
