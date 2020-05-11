class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :unit_type
      t.integer :serving_size
      t.integer :calories
      t.integer :carbs
      t.integer :fat
      t.integer :protein
      t.integer :sodium
      t.integer :sugar
      t.timestamps null: false 
    end
  end
end
