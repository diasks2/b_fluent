class CreateCasecs < ActiveRecord::Migration
  def change
    create_table :casecs do |t|
      t.date :c_date
      t.integer :c_one
      t.integer :c_two
      t.integer :c_three
      t.integer :c_four
      t.integer :user_id

      t.timestamps
    end
    add_index :casecs, [:user_id, :c_date]
  end
end
