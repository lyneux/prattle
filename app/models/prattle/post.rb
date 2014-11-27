module Prattle
  class Post < ActiveRecord::Base
  	belongs_to :topic, touch: true
  	belongs_to :user, class_name: "Member"
  	#validates :text, presence: true, length: {minimum: 5 }
  	#validates :topic_position, presence: true

  	before_save :set_topic_position

  	private
  		def set_topic_position
  			if self.new_record?
  				#TODO Do we need to handle potential race condition here? How important are these position things?
  				self.topic_position = 1
  				position = Post.where("topic_id = " + self.topic.id.to_s).maximum("topic_position")
  				self.topic_position = position + 1 if position
  			end
  		end

  end
end
