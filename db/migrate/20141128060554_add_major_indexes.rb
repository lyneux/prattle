class AddMajorIndexes < ActiveRecord::Migration
  def change
  	add_index :prattle_posts, :topic_id
  	add_index :prattle_topics, :forum_id
  	add_index :prattle_forums, :category_id
  	add_index :prattle_topic_read_up_to_marks, :post_id
  	add_index :prattle_topic_read_up_to_marks, :user_id
  	add_index :prattle_topic_read_up_to_marks, :topic_id
  end
end
