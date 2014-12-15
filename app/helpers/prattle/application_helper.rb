module Prattle
  module ApplicationHelper

  	def format_post_text(text)
  		sanitized = Sanitize.clean(text, Sanitize::Config::BASIC) if text
  		text.bbcode_to_html_with_formatting.html_safe if sanitized
  	end

  	def edit_post?(post)
  		prattle_admin? || (post.user == prattle_user) unless post.topic.locked
  	end

  end
end
