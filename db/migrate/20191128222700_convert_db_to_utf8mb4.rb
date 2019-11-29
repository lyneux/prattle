class ConvertDbToUtf8mb4 < ActiveRecord::Migration
  def change
    execute "ALTER TABLE prattle_categories CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute "ALTER TABLE prattle_forums CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute "ALTER TABLE prattle_member_settings CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute "ALTER TABLE prattle_post_notifications CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute "ALTER TABLE prattle_posts CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute "ALTER TABLE prattle_topic_read_up_to_marks CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute "ALTER TABLE prattle_topics CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
  end
end
