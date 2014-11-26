class CreatePrattleCategories < ActiveRecord::Migration
  def change
    create_table :prattle_categories do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
