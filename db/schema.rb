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

ActiveRecord::Schema.define(version: 20150706221818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "expires_at"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "access_tokens", ["user_id"], name: "index_access_tokens_on_user_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.string   "company_name"
    t.string   "from_name"
    t.string   "background_color"
    t.string   "foreground_color"
    t.string   "reply_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.string   "image_url"
    t.string   "from_address"
    t.string   "company_url"
  end

  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id", using: :btree

  create_table "mailchimp_lists", force: :cascade do |t|
    t.string   "mailchimp_id"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "mailchimp_lists", ["user_id"], name: "index_mailchimp_lists_on_user_id", using: :btree

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "subscription_date"
    t.integer  "mailchimp_list_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "subscribers", ["mailchimp_list_id"], name: "index_subscribers_on_mailchimp_list_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "mailchimp_id"
    t.string   "account_name"
    t.string   "login"
    t.string   "mailchimp_auth_token"
    t.string   "mailchimp_data_center"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "selectedListId"
  end

  add_foreign_key "access_tokens", "users"
  add_foreign_key "mailchimp_lists", "users"
  add_foreign_key "subscribers", "mailchimp_lists"
end
