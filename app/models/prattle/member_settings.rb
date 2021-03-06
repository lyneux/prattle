module Prattle
  class MemberSettings < ActiveRecord::Base
  	belongs_to :user, class_name: Prattle.user_class.to_s
  	validates :post_count, presence: true, numericality: true
  	validates :notify_all, :inclusion => {:in => [true, false]}
  	validates :user, presence: true, uniqueness: true
  end
end
