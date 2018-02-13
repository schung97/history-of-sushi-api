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

ActiveRecord::Schema.define(version: 20180201134201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "contents", force: :cascade do |t|
    t.bigint "category_id"
    t.text "fact"
    t.index ["category_id"], name: "index_contents_on_category_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_favorites_on_restaurant_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.bigint "category_id"
    t.string "question"
    t.string "answer"
    t.string "other", default: [], array: true
    t.index ["category_id"], name: "index_questionnaires_on_category_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "rank"
    t.string "name"
    t.integer "rating"
    t.string "address"
    t.string "city"
    t.string "phone"
    t.integer "review_count"
    t.string "url"
    t.string "price"
    t.string "photos", default: [], array: true
  end

  create_table "suggestions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_suggestions_on_restaurant_id"
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "password_digest"
    t.string "knowledge", default: "Amateur"
    t.string "avatar", default: "https://media.giphy.com/media/xUOwG7xTFIS7K5Z12o/giphy.gif"
  end

  add_foreign_key "contents", "categories"
  add_foreign_key "favorites", "restaurants"
  add_foreign_key "favorites", "users"
  add_foreign_key "questionnaires", "categories"
  add_foreign_key "suggestions", "restaurants"
  add_foreign_key "suggestions", "users"
end
