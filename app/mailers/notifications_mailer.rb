class NotificationsMailer < ActionMailer::Base

  default :from => "info@ovec.nl"
  default :to => "peter_vd_berg@hotmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Ovec_multiservice] #{message.subject}")
  end

end