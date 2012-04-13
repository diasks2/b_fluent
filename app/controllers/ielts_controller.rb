# -*- encoding : utf-8 -*-
class IeltsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy]
  before_filter :correct_user,   only: :destroy

def ieltjournal
  @ielt = current_user.ielts.paginate(page: params[:page]) if signed_in?
end

def new
  @ielt = Ielt.new
 
  respond_to do |format|
    format.html  # new.html.erb
    format.json  { render :json => @ielt }
  end
end

  def create
    @ielt = current_user.ielts.build(params[:ielt])
    if @ielt.save
      flash[:success] = "IELTS test created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @ielt.destroy
    redirect_back_or root_path
  end

  private

    def correct_user
      @ielt = current_user.ielts.find_by_id(params[:id])
      redirect_to root_path if @ielt.nil?
    end
end
