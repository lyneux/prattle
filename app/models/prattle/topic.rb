module Prattle
  class Topic < ActiveRecord::Base
  	belongs_to :forum
  	has_many :posts
  	validates :view_count, presence: true
    validates :last_post_at, presence: true

  	after_initialize :defaults

  	scope :by_most_recent, -> { order(last_post_at: :desc) }

  	def read_up_to_post(user)
  		Prattle::TopicReadUpToMark.includes(:post).find_by(topic_id: self.id, user_id: user.id)
  	end

  	def increment_views
  		self.view_count = self.view_count + 1
  		self.save!
  	end

    def formatted_subject
      result = self.subject
      if self.locked
        result = '<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>'.html_safe + result
      end
      result
    end

  	private
  		def defaults
  			self.view_count = 0 if new_record?
  		end

  end
end
