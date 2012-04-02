# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController
  def home
    @toeictest = current_user.toeictests.build if signed_in?
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
