class CreatePrattleTopics < ActiveRecord::Migration
  def change
    create_table :prattle_topics do |t|
      t.integer :forum_id
      t.integer :views
      t.string :subject
      t.boolean :locked
      t.boolean :pinned

      t.timestamps
    end
  end
end
