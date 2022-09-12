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

ActiveRecord::Schema.define(version: 2022_09_12_072051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "performance_id"
    t.bigint "artist_profile_id"
    t.text "message"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_profile_id"], name: "index_applications_on_artist_profile_id"
    t.index ["performance_id"], name: "index_applications_on_performance_id"
  end

  create_table "artist_genres", force: :cascade do |t|
    t.bigint "artist_profile_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_profile_id"], name: "index_artist_genres_on_artist_profile_id"
    t.index ["genre_id"], name: "index_artist_genres_on_genre_id"
  end

  create_table "artist_profiles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "zipcode"
    t.string "city"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_artist_profiles_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performance_genres", force: :cascade do |t|
    t.bigint "performance_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_performance_genres_on_genre_id"
    t.index ["performance_id"], name: "index_performance_genres_on_performance_id"
  end

  create_table "performances", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "date"
    t.integer "duration"
    t.integer "type"
    t.bigint "venue_profile_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_profile_id"], name: "index_performances_on_venue_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_artist", default: false
    t.boolean "is_venue", default: false
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venue_profiles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "type_of_location"
    t.integer "capacity"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_venue_profiles_on_user_id"
  end

  add_foreign_key "artist_genres", "artist_profiles"
  add_foreign_key "artist_genres", "genres"
end
