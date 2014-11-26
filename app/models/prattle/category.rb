module Prattle
  class Category < ActiveRecord::Base
  	has_many :forums

  	validates :name, presence: true, length: {minimum: 1 }
  end
end
