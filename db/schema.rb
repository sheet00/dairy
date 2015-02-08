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

ActiveRecord::Schema.define(version: 20150208021302) do

  create_table "diaries", force: :cascade do |t|
    t.datetime "authored_on",               null: false
    t.integer  "category_id", limit: 4,     null: false
    t.string   "title",       limit: 255,   null: false
    t.text     "body",        limit: 65535, null: false
    t.integer  "wheather_id", limit: 4
    t.integer  "mt_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "diaries", ["authored_on"], name: "index_diaries_on_authored_on", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255, null: false
    t.string   "password_digest", limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
