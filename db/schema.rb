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

ActiveRecord::Schema.define(version: 20150928154802) do

  create_table "clients", force: :cascade do |t|
    t.integer  "store_id",                                         null: false
    t.string   "name",                                             null: false
    t.decimal  "balance",    precision: 8, scale: 2, default: 0.0, null: false
    t.string   "phone",                                            null: false
    t.string   "address"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "clients", ["store_id"], name: "index_clients_on_store_id"

  create_table "cloths", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cloths", ["group_id"], name: "index_cloths_on_group_id"

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_users", ["group_id", "user_id"], name: "index_group_users_on_group_id_and_user_id"
  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id"
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string   "title",                  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "precision",  default: 2, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",                                          null: false
    t.string   "cloth_title",                                       null: false
    t.decimal  "price",       precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "status",                              default: 0,   null: false
    t.datetime "fetched_at"
    t.string   "wash_way",                                          null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "store_id",                                         null: false
    t.integer  "client_id",                                        null: false
    t.decimal  "price",      precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "user_id",                                          null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id"
  add_index "orders", ["store_id", "client_id"], name: "index_orders_on_store_id_and_client_id"
  add_index "orders", ["store_id"], name: "index_orders_on_store_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "store_users", force: :cascade do |t|
    t.integer  "store_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "store_users", ["store_id", "user_id"], name: "index_store_users_on_store_id_and_user_id"
  add_index "store_users", ["store_id"], name: "index_store_users_on_store_id"
  add_index "store_users", ["user_id"], name: "index_store_users_on_user_id"

  create_table "stores", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id",   null: false
    t.string   "phone"
    t.string   "landline"
    t.string   "location"
  end

  add_index "stores", ["group_id"], name: "index_stores_on_group_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                                null: false
    t.integer  "role",                                null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wash_ways", force: :cascade do |t|
    t.integer  "cloth_id",                                         null: false
    t.string   "title",                                            null: false
    t.decimal  "price",      precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "wash_ways", ["cloth_id"], name: "index_wash_ways_on_cloth_id"

end
