class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.date :date
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
