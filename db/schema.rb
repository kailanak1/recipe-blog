# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_23_163056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "date_mades", force: :cascade do |t|
    t.integer "recipe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "recipe_id"
    t.string "name"
    t.string "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "date_id"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.string "category"
    t.string "main_pic"
    t.string "user_id"
    t.string "likes"
    t.string "version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "recipe_id", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer "recipe_id"
    t.string "step_summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "recipe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_followers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio"
    t.string "avatar"
    t.string "favorites"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end