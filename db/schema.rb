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

ActiveRecord::Schema.define(version: 20140204090220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "github_short"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "watchers"
    t.integer  "stargazers"
    t.integer  "github_id"
    t.string   "created_by"
    t.string   "avatar_url"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["github_id"], name: "index_projects_on_github_id", unique: true, using: :btree

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.boolean  "active",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["category_id"], name: "index_subscriptions_on_category_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.boolean  "verified",   default: false
    t.boolean  "active",     default: false
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
