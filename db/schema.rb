# -*- encoding : utf-8 -*-
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120412130723) do

  create_table "casecs", :force => true do |t|
    t.date     "c_date"
    t.integer  "c_one"
    t.integer  "c_two"
    t.integer  "c_three"
    t.integer  "c_four"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "casecs", ["user_id", "c_date"], :name => "index_casecs_on_user_id_and_c_date"

  create_table "toeflis", :force => true do |t|
    t.date     "toefli_date"
    t.integer  "toefli_r"
    t.integer  "toefli_w"
    t.integer  "toefli_l"
    t.integer  "toefli_s"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "toeflis", ["user_id", "toefli_date"], :name => "index_toeflis_on_user_id_and_toefli_date"

  create_table "toeictests", :force => true do |t|
    t.datetime "t_date"
    t.integer  "l_score"
    t.integer  "r_score"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "toeictests", ["user_id", "t_date"], :name => "index_toeictests_on_user_id_and_t_date"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
