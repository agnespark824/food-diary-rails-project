class MealsFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :meals_foods, id: false do |t|
      t.integer :meal_id
      t.integer :food_id
    end
  end
end
