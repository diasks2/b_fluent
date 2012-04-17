# -*- encoding : utf-8 -*-
class CreateToeicsws < ActiveRecord::Migration
  def change
    create_table :toeicsws do |t|
      t.integer :toeicsw_s
      t.integer :toeicsw_w
      t.date :toeicsw_date
      t.integer :user_id

      t.timestamps
    end
    add_index :toeicsws, [:user_id, :toeicsw_date]
  end
end
