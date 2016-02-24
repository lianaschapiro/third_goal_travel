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

ActiveRecord::Schema.define(version: 20160224172458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boardposts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boardposts", ["country_id"], name: "index_boardposts_on_country_id", using: :btree
  add_index "boardposts", ["user_id"], name: "index_boardposts_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url_name"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "countries", ["region_id"], name: "index_countries_on_region_id", using: :btree

  create_table "journals", force: :cascade do |t|
    t.string   "link"
    t.text     "description"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "author"
  end

  add_index "journals", ["country_id"], name: "index_journals_on_country_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.string   "title"
    t.text     "body"
    t.string   "address"
    t.string   "full_address"
    t.integer  "user_id"
    t.integer  "country_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "post_type"
  end

  add_index "posts", ["country_id"], name: "index_posts_on_country_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_digest"
    t.text     "about"
    t.boolean  "admin"
    t.boolean  "volunteer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "boardposts", "countries"
  add_foreign_key "boardposts", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "countries", "regions"
  add_foreign_key "journals", "countries"
  add_foreign_key "posts", "countries"
  add_foreign_key "posts", "users"
end
