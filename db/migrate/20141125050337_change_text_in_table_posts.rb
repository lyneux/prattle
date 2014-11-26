class ChangeTextInTablePosts < ActiveRecord::Migration
  def change
  	change_column :prattle_posts, :text, :text
  end
end
