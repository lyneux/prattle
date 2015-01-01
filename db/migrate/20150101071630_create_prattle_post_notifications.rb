class CreatePrattlePostNotifications < ActiveRecord::Migration
  def change
    create_table :prattle_post_notifications do |t|
      t.string :post_id
      t.string :user_id
      t.boolean :sent

      t.timestamps
    end
    add_index :prattle_post_notifications, :sent
  end
end
