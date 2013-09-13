class NotificationsMailer < ActionMailer::Base

  default :from => "info@ovec.nl"
  default :to => "info@ovec-multiservice.nl"

  def new_message(message)
    @message = message
    if message.attachment.present?
    	attachments[message.attachment.original_filename] = File.open(message.attachment.path, 'rb'){|f| f.read}
    end
    mail(:subject => "[Ovec_multiservice] #{message.subject}")
  end

end