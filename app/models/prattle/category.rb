module Prattle
  class Category < ActiveRecord::Base
  	has_many :forums

  	validates :name, presence: true, length: {minimum: 1 }
  	validates :description, presence: false, length: {minimum: 5 }
  end
end
