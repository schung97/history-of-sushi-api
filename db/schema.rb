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

ActiveRecord::Schema.define(version: 20180131230526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: :cascade do |t|
    t.string "category"
    t.text "fact"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_favorites_on_restaurant_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.bigint "content_id"
    t.string "question"
    t.string "answers", array: true
    t.index ["answers"], name: "index_questionnaires_on_answers", using: :gin
    t.index ["content_id"], name: "index_questionnaires_on_content_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "alias"
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
    t.string "email"
    t.string "password_digest"
    t.string "joined_on"
    t.string "knowledge", default: "Amateur"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "favorites", "restaurants"
  add_foreign_key "favorites", "users"
  add_foreign_key "questionnaires", "contents"
  add_foreign_key "suggestions", "restaurants"
  add_foreign_key "suggestions", "users"
end
