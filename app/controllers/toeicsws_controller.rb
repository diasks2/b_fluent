# -*- encoding : utf-8 -*-
class ToeicswsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy, :toeicswjournal]
  before_filter :correct_user,   only: :destroy

def toeicswjournal
  @toeicsw = current_user.toeicsws.paginate(page: params[:page]) if signed_in?
end

def new
  @toeicsw = Toeicsw.new
 
  respond_to do |format|
    format.html  # new.html.erb
    format.json  { render :json => @toeicsw }
  end
end

  def create
    @toeicsw = current_user.toeicsws.build(params[:toeicsw])
    if @toeicsw.save
      flash[:success] = "TOEIC® SW test created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @toeicsw.destroy
    redirect_back_or current_user
  end

  private

    def correct_user
      @toeicsw = current_user.toeicsws.find_by_id(params[:id])
      redirect_to root_path if @toeicsw.nil?
    end
end