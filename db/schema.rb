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

ActiveRecord::Schema.define(version: 2019_02_12_150803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coins", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "user_one_id"
    t.integer "user_two_id"
    t.float "user_one_amount"
    t.float "user_two_amount"
    t.string "user_one_currency_symbol"
    t.string "user_two_currency_symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "user_one_price"
    t.float "user_two_price"
  end

  create_table "user_coins", force: :cascade do |t|
    t.integer "user_id"
    t.integer "coin_id"
    t.float "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "selling"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_pic_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
