module Prattle
  module NotificationsHelper

  	def send_notifications
    	puts "Processing notifications for new post: " + @post.id.to_s
    	member_settings_to_notify = Prattle::MemberSettings.where(notify_all: true)
    	member_settings_to_notify.each do |member_settings|
        puts "Sending email to: " + member_settings.user.email if member_settings.user.email
        Prattle::PostNotificationMailer.delay.notify_of_new_post(@post.id, member_settings.user.id)
      end
    end
    
  end
end
