# -*- encoding : utf-8 -*-
class BridgesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy, :bridgejournal]
  before_filter :correct_user,   only: :destroy

def bridgejournal
  @bridges = current_user.bridges.paginate(page: params[:page]) if signed_in?
end

def new
  @bridge = Bridge.new
 
  respond_to do |format|
    format.html  # new.html.erb
    format.json  { render :json => @bridge }
  end
end

  def create
    @bridge = current_user.bridges.build(params[:bridge])
    if @bridge.save
      flash[:success] = "TOEIC® Bridge test created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @bridge.destroy
    redirect_back_or current_user
  end

  private

    def correct_user
      @bridge = current_user.bridges.find_by_id(params[:id])
      redirect_to root_path if @bridge.nil?
    end
end
