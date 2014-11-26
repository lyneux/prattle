class AddUserIdToPrattlePosts < ActiveRecord::Migration
  def change
    add_column :prattle_posts, :user_id, :integer
  end
end
