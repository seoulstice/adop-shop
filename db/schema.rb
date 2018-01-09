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

ActiveRecord::Schema.define(version: 20180109210553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "dog_categories", force: :cascade do |t|
    t.bigint "dog_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_dog_categories_on_category_id"
    t.index ["dog_id"], name: "index_dog_categories_on_dog_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "size"
    t.integer "weight"
    t.boolean "cat_friendly"
    t.integer "gender"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.boolean "retired", default: false
    t.string "image"
    t.integer "retired_count", default: 0
  end

  create_table "order_dogs", force: :cascade do |t|
    t.bigint "dog_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["dog_id"], name: "index_order_dogs_on_dog_id"
    t.index ["order_id"], name: "index_order_dogs_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "address"
    t.bigint "user_id"
    t.string "purchaser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.string "username"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "name"
    t.integer "orders_count", default: 0
    t.index ["orders_count"], name: "index_users_on_orders_count"
  end

  add_foreign_key "dog_categories", "categories"
  add_foreign_key "dog_categories", "dogs"
  add_foreign_key "order_dogs", "dogs"
  add_foreign_key "order_dogs", "orders"
  add_foreign_key "orders", "users"
end
