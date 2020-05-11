class CreateRecipeFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_foods do |t|
      t.belongs_to :recipe, null: false, foreign_key: true
      t.belongs_to :food, null: false, foreign_key: true
      t.integer :servings
      t.timestamps
    end
  end
end
