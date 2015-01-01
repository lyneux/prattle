module Prattle
  module MemberSettingsHelper

    def initialise_member_settings
      post_count = 0
      posts = Prattle::Post.where(user_id: prattle_user.id)
      post_count = posts.count if posts
      member_settings = prattle_user.build_prattle_member_settings(:post_count => post_count, :notify_all => 0)
      member_settings.save
    end

    def update_post_count
      member_settings = prattle_user.prattle_member_settings
      initialise_member_settings if member_settings.nil?
      member_settings.post_count += 1
      member_settings.save
    end

  end
end
