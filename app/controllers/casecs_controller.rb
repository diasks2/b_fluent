class CasecsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy]
  before_filter :correct_user,   only: :destroy


def new
  @casec = Casec.new
 
  respond_to do |format|
    format.html  # new.html.erb
    format.json  { render :json => @casec }
  end
end

  def create
    @casec = current_user.casecs.build(params[:casec])
    if @casec.save
      flash[:success] = "CASEC test created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @casec.destroy
    redirect_back_or root_path
  end

  private

    def correct_user
      @casec = current_user.casecs.find_by_id(params[:id])
      redirect_to root_path if @casec.nil?
    end
end