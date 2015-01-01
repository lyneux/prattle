# desc "Explaining what the task does"
# task :prattle do
#   # Task goes here
# end
namespace :prattle do

	desc "Creates initial member settings for every member"
	task :create_initial_member_settings => :environment do

		Prattle::MemberSettings.destroy_all

	 	users = Prattle.user_class.all

		users.each do |user|
		  	puts user
		  	member_settings = user.build_prattle_member_settings
		  	

		  	#posts = Prattle::Post.find_by_user_id(user.id)
		  	posts = Prattle::Post.where(user_id: user.id)

		  	if posts
		  		member_settings.post_count = posts.count
		  	else
		  		member_settings.post_count = 0
		  	end
		  	member_settings.notify_all = false

		  	member_settings.save
		  	user.save

	  	end
	  	puts "Updated: " + users.count.to_s + " members"

	end

	desc "Sends post notifications"
	task :send_post_notifications => :environment do
		notifications = Prattle::PostNotifications.where(:sent => false)
		notifications.each do |notification|
			puts "Sending a notification for post " + notification.post.id.to_s + " to: " + notification.user.forename + " " + notification.user.surname
			Prattle::PostNotificationMailer.notify_of_new_post(notification.post.id, notification.user.id).deliver
			notification.sent = true
			notification.save
		end
	end

end

