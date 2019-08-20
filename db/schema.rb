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

ActiveRecord::Schema.define(version: 2019_08_19_171558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deals", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "requester_record_id"
    t.bigint "receiver_record_id"
    t.index ["receiver_record_id"], name: "index_deals_on_receiver_record_id"
    t.index ["requester_record_id"], name: "index_deals_on_requester_record_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_preferences_on_genre_id"
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "condition"
    t.boolean "swappable", default: false
    t.boolean "out", default: false
    t.bigint "user_id"
    t.bigint "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_records_on_release_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "releases", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "artist"
    t.string "label"
    t.string "year"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_releases_on_genre_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.integer "duration"
    t.bigint "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_tracks_on_release_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "username"
    t.string "name"
    t.string "location"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "deals", "records", column: "receiver_record_id"
  add_foreign_key "deals", "records", column: "requester_record_id"
  add_foreign_key "preferences", "genres"
  add_foreign_key "preferences", "users"
  add_foreign_key "records", "releases"
  add_foreign_key "records", "users"
  add_foreign_key "releases", "genres"
  add_foreign_key "tracks", "releases"
end
