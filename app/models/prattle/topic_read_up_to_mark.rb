module Prattle
  class TopicReadUpToMark < ActiveRecord::Base
  	belongs_to :topic
  	belongs_to :user, class_name: Prattle.user_class.to_s
  	belongs_to :post

  	validates :topic, presence: true
  	validates :user, presence: true
  	validates :post, presence: true
  end
end
