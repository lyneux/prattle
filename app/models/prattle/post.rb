module Prattle
  class Post < ActiveRecord::Base
  	belongs_to :topic
  	belongs_to :user, class_name: "Member"
  	validates :text, presence: true, length: {minimum: 5 }
  end
end
