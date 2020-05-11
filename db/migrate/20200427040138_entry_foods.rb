class EntryFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_foods, id: false do |t|
      t.integer :entry_id
      t.integer :food_id
      t.integer :servings
    end
  end
end
