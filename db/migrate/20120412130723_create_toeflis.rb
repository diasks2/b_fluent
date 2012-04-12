# -*- encoding : utf-8 -*-
class CreateToeflis < ActiveRecord::Migration
  def change
    create_table :toeflis do |t|
      t.date :toefli_date
      t.integer :toefli_r
      t.integer :toefli_w
      t.integer :toefli_l
      t.integer :toefli_s
      t.integer :user_id

      t.timestamps
    end
     add_index :toeflis, [:user_id, :toefli_date]
  end
end
