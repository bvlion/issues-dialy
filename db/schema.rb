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

ActiveRecord::Schema.define(version: 2022_01_03_121946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", id: :string, force: :cascade do |t|
    t.string "site_id", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_articles_on_site_id"
    t.index ["title"], name: "index_articles_on_title"
  end

  create_table "sites", id: :string, force: :cascade do |t|
    t.string "user_id", null: false
    t.string "url", null: false
    t.string "pass", null: false
    t.string "top_image_url", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.boolean "ban", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "articles", "sites"
  add_foreign_key "sites", "users"
end
