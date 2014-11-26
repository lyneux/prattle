class CreatePrattlePosts < ActiveRecord::Migration
  def change
    create_table :prattle_posts do |t|
      t.string :topic_id
      t.integer :topic_position
      t.string :text

      t.timestamps
    end
  end
end
