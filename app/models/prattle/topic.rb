module Prattle
  class Topic < ActiveRecord::Base
  	belongs_to :forum
  	has_many :posts

  	scope :by_most_recent, -> { order(updated_at: :desc) }
  end
end
