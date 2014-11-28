class CreatePrattleTopicReadUpToMarks < ActiveRecord::Migration
  def change
    create_table :prattle_topic_read_up_to_marks do |t|
      t.integer :user_id
      t.integer :topic_id
      t.integer :post_id

      t.timestamps
    end
  end
end
