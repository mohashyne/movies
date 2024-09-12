# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_09_102958) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_v3_movies", force: :cascade do |t|
    t.string "name"
    t.string "actor"
    t.string "producer"
    t.text "description"
    t.decimal "net_worth"
    t.datetime "starts_at"
    t.decimal "price"
    t.integer "release_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categorizations_on_category_id"
    t.index ["movie_id"], name: "index_categorizations_on_movie_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_likes_on_movie_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "actor"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "producer"
    t.string "net_worth"
    t.string "release_year"
    t.datetime "starts_at"
    t.text "description"
    t.string "image_file_name", default: "placeholder.jpg"
    t.integer "capacity", default: 1
  end

  create_table "registrations", force: :cascade do |t|
    t.string "how_heard"
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["movie_id"], name: "index_registrations_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "categorizations", "categories"
  add_foreign_key "categorizations", "movies"
  add_foreign_key "likes", "movies"
  add_foreign_key "likes", "users"
  add_foreign_key "registrations", "movies"
end
