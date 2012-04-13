# -*- encoding : utf-8 -*-
class CreateIelts < ActiveRecord::Migration
  def change
    create_table :ielts do |t|
      t.float :ielt_score
      t.date :ielt_date
      t.integer :user_id

      t.timestamps
    end
    add_index :ielts, [:user_id, :ielt_date]
  end
end
