class AddLastPostAtToTopic < ActiveRecord::Migration
  def change
  	add_column :prattle_topics, :last_post_at, :datetime
  	add_index :prattle_topics, :last_post_at
  end
end
