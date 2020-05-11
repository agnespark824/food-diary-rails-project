class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.date :date
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
