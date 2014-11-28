Forem.user_class.class_eval do
	has_many :prattle_topic_read_up_to_marks, :class_name => "Prattle::TopicReadUpToMark", :foreign_key => "user_id"
	#has_many :read_prattle_posts, :through  => :prattle_read_posts
	#has_many :read_prattle_topics, :through  => :prattle_read_posts
end