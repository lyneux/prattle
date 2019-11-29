module Prattle
  module ForumsHelper

  	def show_new_marker(topic, user)
      read_up_to_post = topic.read_up_to_post(user)
      puts "topic.posts:" + topic.posts.count.to_s
      if topic.posts && !topic.posts.empty?
    		if read_up_to_post
    			if topic.posts.last.topic_position == read_up_to_post.post.topic_position
            false
    			else
    				true
    			end
    		else
    			true
    		end
      else
        false
      end
  	end

    def link_to_latest_unread_post(topic, user)
      latest_unread_post = 1
      read_up_to_post = topic.read_up_to_post(user)
      if read_up_to_post
        read_up_to_topic_position = read_up_to_post.post.topic_position
        latest_unread_post = read_up_to_topic_position
        unless topic.posts.last.topic_position == read_up_to_post.post.topic_position
          # They haven't read up to the last one, so the first unread one is the one after
          latest_unread_post = latest_unread_post + 1
        end
      end

      # Work out which page the next unread post is on
      page = ((latest_unread_post/25)+1).floor
      
      display_string = (topic.posts.last.topic_position - latest_unread_post + 1).to_s + " new"
      return link_to display_string, category_forum_topic_path(:category_id => topic.forum.category.id,
                                               :forum_id => topic.forum.id,
                                               :id => topic.id,
                                               :page => page.to_s,
                                               :anchor => "post" + latest_unread_post.to_s)

    end

    def path_to_post(post)
      topic_position = post.topic_position
      page = ((topic_position/25)+1).floor
      category_forum_topic_url(:category_id => post.topic.forum.category.id,
                                      :forum_id => post.topic.forum.id,
                                      :id => post.topic.id,
                                      :page => page.to_s,
                                      :anchor => "post" + topic_position.to_s)
    end

  end
end
