# -*- encoding : utf-8 -*-
class CreateBridges < ActiveRecord::Migration
  def change
    create_table :bridges do |t|
      t.integer :bridge_l
      t.integer :bridge_r
      t.date :bridge_date
      t.integer :user_id

      t.timestamps
    end
    add_index :bridges, [:user_id, :bridge_date]
  end
end
