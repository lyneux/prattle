module Prattle
  class PostNotifications < ActiveRecord::Base
  	belongs_to :post
  	belongs_to :user, class_name: Prattle.user_class.to_s
  	validates :sent, :inclusion => {:in => [true, false]}
  end
end
