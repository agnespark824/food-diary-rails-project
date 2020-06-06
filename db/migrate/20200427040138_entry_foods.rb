class EntryFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_foods
      t.integer :entry_id, null: false, foreign_key: true
      t.integer :food_id, null: false, foreign_key: true
      t.float :servings
      t.timestamps null: false
    end
  end
end
