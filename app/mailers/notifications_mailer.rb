# -*- encoding : utf-8 -*-
class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@bifluent.com"
  default :to => "info@bifluent.com"

  def new_message(message)
    @message = message
    mail(:subject => "[BiFluent.com Message] #{message.subject}")
  end

end
