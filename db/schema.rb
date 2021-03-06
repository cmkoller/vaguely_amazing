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

ActiveRecord::Schema.define(version: 20150917165016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_messages", force: :cascade do |t|
    t.string "email", null: false
    t.text   "body"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.boolean "encounters_frustrating"
    t.boolean "encounters_fun"
    t.boolean "encounters_simple"
    t.boolean "encounters_complex"
    t.boolean "encounters_logical"
    t.boolean "encounters_appealing"
    t.boolean "encounters_unappealing"
    t.boolean "items_frustrating"
    t.boolean "items_fun"
    t.boolean "items_simple"
    t.boolean "items_complex"
    t.boolean "items_logical"
    t.boolean "items_appealing"
    t.boolean "items_unappealing"
    t.boolean "classes_frustrating"
    t.boolean "classes_fun"
    t.boolean "classes_simple"
    t.boolean "classes_complex"
    t.boolean "classes_logical"
    t.boolean "classes_appealing"
    t.boolean "classes_unappealing"
    t.boolean "cooperative_frustrating"
    t.boolean "cooperative_fun"
    t.boolean "cooperative_simple"
    t.boolean "cooperative_complex"
    t.boolean "cooperative_logical"
    t.boolean "cooperative_appealing"
    t.boolean "cooperative_unappealing"
    t.text    "other_feedback"
  end

  create_table "games", force: :cascade do |t|
    t.string "title",          null: false
    t.float  "price"
    t.string "file"
    t.string "featured_image"
    t.text   "description"
  end

  create_table "posts", force: :cascade do |t|
    t.string  "title",     null: false
    t.text    "body"
    t.integer "author_id", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "buyer_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["game_id", "buyer_id"], name: "index_purchases_on_game_id_and_buyer_id", unique: true, using: :btree

  create_table "redactor_assets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "role",                   default: "member", null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
