# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController
  def home
  @toeictest = current_user.toeictests.paginate(page: params[:page]) if signed_in?
  @casec = current_user.casecs.paginate(page: params[:page]) if signed_in?
  @toefli = current_user.toeflis.paginate(page: params[:page]) if signed_in?
  end

  def about
  end

  def contact
  end

  def pricing
  end

  def principles
  end
end
