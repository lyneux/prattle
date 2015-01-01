module Prattle
  module MemberSettingsHelper

 	def initialise_member_settings
 		member_settings = prattle_user.build_prattle_member_settings
	    posts = Prattle::Post.where(user_id: prattle_user.id)

	    if posts
	    	member_settings.post_count = posts.count
	    else
	        member_settings.post_count = 0
	    end
	    member_settings.notify_all = false
	    member_settings.save
    end

    def update_post_count
    	member_settings = prattle_user.prattle_member_settings
    	member_settings = initialise_member_settings unless member_settings
    	member_settings.post_count += 1
    	member_settings.save
    end

  end
end
