module Prattle
  class Forum < ActiveRecord::Base
  	belongs_to :category
  	has_many :topics
  	has_many :posts, through: :topics
  end
end
