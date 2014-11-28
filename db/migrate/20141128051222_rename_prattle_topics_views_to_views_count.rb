class RenamePrattleTopicsViewsToViewsCount < ActiveRecord::Migration
  def change
  	rename_column :prattle_topics, :views, :view_count
  end
end
