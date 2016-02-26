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

ActiveRecord::Schema.define(version: 20160226171046) do

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
    t.text     "body"
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["review_id"], name: "index_comments_on_review_id", using: :btree
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
    t.integer  "user_id"
  end

  add_index "journals", ["country_id"], name: "index_journals_on_country_id", using: :btree
  add_index "journals", ["user_id"], name: "index_journals_on_user_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url_name"
  end

  create_table "reviews", force: :cascade do |t|
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

  add_index "reviews", ["country_id"], name: "index_reviews_on_country_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

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
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "countries", "regions"
  add_foreign_key "journals", "countries"
  add_foreign_key "reviews", "countries"
  add_foreign_key "reviews", "users"
end
