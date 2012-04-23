# -*- encoding : utf-8 -*-
class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "ありがとうございます。お問い合わせありがとうございます。 担当者よりおってご連絡させていただきますので、今しばらくお待ちください。")
    else
      flash.now.alert = "全部の欄を入力してください。"
      render :new
    end
  end

end
