# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController
  def home
  @toeictest = current_user.toeictests.paginate(page: params[:page]) if signed_in?
  end

  def about
  end

  def contact
    @toeictest = current_user.toeictests.paginate(page: params[:page]) if signed_in?
  end

  def pricing
  end

  def principles
  end
end
