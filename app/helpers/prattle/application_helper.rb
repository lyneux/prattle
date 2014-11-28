module Prattle
  module ApplicationHelper

  	def format_post_text(text)
  		sanitized = Sanitize.clean(text, Sanitize::Config::BASIC) if text
  		BBRuby.to_html_with_formatting(sanitized).html_safe if sanitized
  	end

  end
end
