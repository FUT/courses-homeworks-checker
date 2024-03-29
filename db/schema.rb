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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 4) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_homeworks", force: true do |t|
    t.integer  "account_id",                  null: false
    t.integer  "homework_id",                 null: false
    t.text     "answer"
    t.string   "url"
    t.string   "title"
    t.boolean  "approved",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homeworks", force: true do |t|
    t.text     "description", null: false
    t.date     "deadline",    null: false
    t.integer  "complexity",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",       null: false
  end

end
