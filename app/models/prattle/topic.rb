module Prattle
  class Topic < ActiveRecord::Base
  	belongs_to :forum
  	has_many :posts
  	validates :view_count, presence: true

  	after_initialize :defaults

  	scope :by_most_recent, -> { order(updated_at: :desc) }

  	def read_up_to_post(user)
  		Prattle::TopicReadUpToMark.find_by(topic_id: self.id, user_id: user.id)
  	end

  	def increment_views
  		self.view_count = self.view_count + 1
  		self.save!
  	end

  	private
  		def defaults
  			self.view_count = 0 if new_record?
  		end

  end
end
