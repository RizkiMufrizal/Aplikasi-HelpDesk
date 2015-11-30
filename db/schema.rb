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

ActiveRecord::Schema.define(version: 20151130120922) do

  create_table "problems", force: :cascade do |t|
    t.string   "title",       limit: 30
    t.string   "description", limit: 150
    t.string   "picture",     limit: 150
    t.string   "status",      limit: 30
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id",     limit: 4
  end

  add_index "problems", ["user_id"], name: "index_problems_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",         limit: 50
    t.string   "name",          limit: 50
    t.string   "password_hash", limit: 150
    t.string   "password_salt", limit: 150
    t.boolean  "enable"
    t.string   "role",          limit: 10
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "problems", "users"
end
