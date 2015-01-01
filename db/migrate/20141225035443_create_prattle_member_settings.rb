class CreatePrattleMemberSettings < ActiveRecord::Migration
  def change
    create_table :prattle_member_settings do |t|
      t.integer :user_id
      t.integer :post_count
      t.boolean :notify_all

      t.timestamps
    end
    add_index :prattle_member_settings, :user_id
    add_index :prattle_member_settings, :notify_all
  end
end
