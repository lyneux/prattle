include Prattle::ForumsHelper

module Prattle
  class PostNotificationMailer < ActionMailer::Base
    default from: "website@londonmountaineeringclub.com"

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.member_mailer.password_reset.subject
    #
    def notify_of_new_post(post_id, user_id)
      @post = Prattle::Post.find(post_id)
      @user = Prattle.user_class.find(user_id)
      mail :to => @user.email, :from => "website@londonmountaineeringclub.com", :subject => "London Mountaineering Club - New Posting"
    end

  end
end
