module Prattle
  module ApplicationHelper

  	def format_post_text(text)
  		sanitized = Sanitize.clean(text, Sanitize::Config::BASIC) if text
  		BBRuby.to_html_with_formatting(sanitized).html_safe if sanitized
  	end

  	def admin_or_own_post?(post)
  		prattle_admin? || (post.user == prattle_user)
  	end

  end
end
