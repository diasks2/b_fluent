# -*- encoding : utf-8 -*-
class CreateToeictests < ActiveRecord::Migration
  def change
    create_table :toeictests do |t|
      t.date :t_date
      t.integer :l_score
      t.integer :r_score
      t.integer :user_id

      t.timestamps
    end
    add_index :toeictests, [:user_id, :t_date]
  end
end
