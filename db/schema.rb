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

ActiveRecord::Schema.define(version: 20180118085137) do

  create_table "customers", force: true do |t|
    t.string   "customer_name"
    t.string   "postal_code"
    t.string   "business"
    t.string   "prefectures"
    t.string   "city"
    t.string   "town_name"
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "stores_count",  default: 0
  end

  create_table "stores", force: true do |t|
    t.integer  "customer_id",                      null: false
    t.string   "store_code"
    t.string   "store_name"
    t.string   "postal_code"
    t.string   "prefectures"
    t.string   "city"
    t.string   "town_name"
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "business_hours_start"
    t.string   "business_hours_end"
    t.string   "pos_type"
    t.string   "ip_address"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "tickets_count",        default: 0
  end

  create_table "tickets", force: true do |t|
    t.integer  "store_id",         null: false
    t.text     "title",            null: false
    t.string   "status",           null: false
    t.string   "sender"
    t.string   "received_user_id"
    t.string   "assign_user_id"
    t.date     "receive_date",     null: false
    t.time     "receive_time",     null: false
    t.date     "close_date"
    t.time     "close_time"
    t.date     "limit_date"
    t.text     "content"
    t.text     "detail"
    t.text     "result"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
