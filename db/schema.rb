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

ActiveRecord::Schema.define(version: 20180228102640) do

  create_table "advertises", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.string "src", null: false
    t.integer "adtype", null: false
    t.integer "priority", null: false
    t.boolean "show", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_tokens", force: :cascade do |t|
    t.string "client_token", null: false
    t.string "id_token"
    t.string "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider_access_token"
    t.string "provider", null: false
    t.string "provider_id_token"
    t.index ["client_token"], name: "index_auth_tokens_on_client_token", unique: true
    t.index ["id_token"], name: "index_auth_tokens_on_id_token", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "url", null: false
    t.string "img", null: false
    t.integer "category1", default: 1, null: false
    t.integer "category2"
    t.integer "category3"
    t.integer "access", default: 0, null: false
    t.float "star", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gtype", default: 99, null: false
  end

  create_table "instructions", force: :cascade do |t|
    t.string "explanation", null: false
    t.integer "step", default: 1, null: false
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_instructions_on_game_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment", null: false
    t.integer "star", default: 0, null: false
    t.integer "game_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_reviews_on_game_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "full_name", null: false
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.boolean "admin"
    t.string "identifer"
    t.string "provider"
    t.index ["identifer"], name: "index_users_on_identifer", unique: true
  end

end
