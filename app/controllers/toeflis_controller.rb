# -*- encoding : utf-8 -*-
class ToeflisController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy, :toeflijournal]
  before_filter :correct_user,   only: :destroy

def toeflijournal
  @toefli = current_user.toeflis.paginate(page: params[:page]) if signed_in?
end

def new
  @toefli = Toefli.new
 
  respond_to do |format|
    format.html  # new.html.erb
    format.json  { render :json => @toefli }
  end
end

  def create
    @toefli = current_user.toeflis.build(params[:toefli])
    if @toefli.save
      flash[:success] = "TOEFL® iBT test created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @toefli.destroy
    redirect_back_or current_user
  end

  private

    def correct_user
      @toefli = current_user.toeflis.find_by_id(params[:id])
      redirect_to root_path if @toefli.nil?
    end
end
