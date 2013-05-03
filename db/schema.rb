# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130503164645) do

  create_table "bads", :force => true do |t|
    t.string   "description"
    t.string   "action"
    t.boolean  "solved",           :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "retrospective_id",                    :null => false
    t.integer  "votes",            :default => 0
    t.integer  "times_being_kept"
  end

  add_index "bads", ["retrospective_id"], :name => "index_bads_on_retrospective_id"

  create_table "goods", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "retrospective_id",                :null => false
    t.integer  "votes",            :default => 0
  end

  add_index "goods", ["retrospective_id"], :name => "index_goods_on_retrospective_id"

  create_table "retrospectives", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id",    :null => false
    t.string   "name",       :null => false
    t.string   "rally_ref"
  end

  add_index "retrospectives", ["user_id"], :name => "index_retrospectives_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "admin",      :default => false
  end

  create_table "users_retrospectives", :force => true do |t|
    t.integer "user_id",          :null => false
    t.integer "retrospective_id", :null => false
  end

end
