class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :daily_entry_id

      t.timestamps null: false
    end
  end
end
