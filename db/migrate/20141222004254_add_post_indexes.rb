class AddPostIndexes < ActiveRecord::Migration
  def change
  	add_index :prattle_posts, :topic_position
  	add_index :prattle_posts, :created_at
  end
end
