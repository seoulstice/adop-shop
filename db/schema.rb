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

ActiveRecord::Schema.define(version: 20180104234048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carrierwave_images", force: :cascade do |t|
    t.string "asset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dog_id"
    t.index ["dog_id"], name: "index_carrierwave_images_on_dog_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "size"
    t.integer "weight"
    t.boolean "cat_friendly"
    t.integer "gender"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.string "slug"
    t.index ["category_id"], name: "index_dogs_on_category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status"
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
  end

  add_foreign_key "carrierwave_images", "dogs"
  add_foreign_key "dogs", "categories"
  add_foreign_key "orders", "users"
end
