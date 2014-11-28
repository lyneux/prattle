require "prattle/engine"
require 'sanitize'
require 'will_paginate-bootstrap'
require 'bb-ruby'
require 'decorators'

module Prattle
	mattr_accessor :user_class, :current_user_method

	class << self
		def user_class
	      if @@user_class.is_a?(String)
	        begin
	          Object.const_get(@@user_class)
	        rescue NameError
	          @@user_class.constantize
	        end
	      end
	    end
	end
end
