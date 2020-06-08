class EntryFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_foods do |t|
      t.belongs_to :entry, null: false, foreign_key: true
      t.belongs_to :food, null: false, foreign_key: true
      t.float :servings
      t.string :meal
      t.timestamps null: false
    end
  end
end
