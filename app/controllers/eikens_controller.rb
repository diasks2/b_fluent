# -*- encoding : utf-8 -*-
class EikensController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy, :eikenjournal]
  before_filter :correct_user,   only: :destroy

def eikenjournal
  @eiken = current_user.eikens.paginate(page: params[:page]) if signed_in?
  @eikens = current_user.eikens.where(eiken_level: 5, eiken_result: true).paginate(page: params[:page]) if signed_in?
end

def new
  @eiken = Eiken.new
 
  respond_to do |format|
    format.html  # new.html.erb
    format.json  { render :json => @eiken }
  end
end

  def create
    @eiken = current_user.eikens.build(params[:eiken])
    if @eiken.save
      flash[:success] = "STEP 英検 test created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @eiken.destroy
    redirect_back_or current_user
  end

  private

    def correct_user
      @eiken = current_user.eikens.find_by_id(params[:id])
      redirect_to root_path if @eiken.nil?
    end
end