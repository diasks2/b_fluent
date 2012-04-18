class CreateEikens < ActiveRecord::Migration
  def change
    create_table :eikens do |t|
      t.integer :eiken_level
      t.boolean :eiken_result
      t.date :eiken_date
      t.integer :user_id

      t.timestamps
    end
    add_index :eikens, [:user_id, :eiken_date]
  end
end
