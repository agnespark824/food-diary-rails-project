class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :serving_unit
      t.float :serving_size
      t.float :calories
      t.float :carbs
      t.float :fat
      t.float :protein
      t.float :sodium
      t.float :sugar
      t.timestamps null: false 
    end
  end
end
