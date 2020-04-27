class CreateDailyEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_entries do |t|
      t.string :entry_date
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
