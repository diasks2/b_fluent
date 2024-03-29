# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
 before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
 before_filter :correct_user,   only: [:edit, :update]
 before_filter :admin_user,     only: :destroy

  def show
    @user = User.find(params[:id])
    @toeictests = @user.toeictests.paginate(page: params[:toeictests_page], per_page: 5)
    @casecs = @user.casecs.paginate(page: params[:casecs_page], per_page: 5)
    @toeflis = @user.toeflis.paginate(page: params[:toeflis_page], per_page: 5)
    @ielts = @user.ielts.paginate(page: params[:ielts_page], per_page: 5)
    @bridges = @user.bridges.paginate(page: params[:bridges_page], per_page: 5)
    @toeicsws = @user.toeicsws.paginate(page: params[:toeicsws_page], per_page: 5)
    @eikens = @user.eikens.paginate(page: params[:eikens_page], per_page: 5)
    @microposts = @user.microposts.paginate(page: params[:page])
    @micropost = current_user.microposts.build if signed_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = I18n.t(:welcome)
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end

 def update
    if @user.update_attributes(params[:user])
      flash[:success] = I18n.t(:profile_updated)
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
