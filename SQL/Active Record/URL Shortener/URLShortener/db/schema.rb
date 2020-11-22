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

ActiveRecord::Schema.define(version: 2020_11_22_121509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shortened_urls", force: :cascade do |t|
    t.string "long_url", null: false
    t.string "short_url", null: false
    t.integer "user_id", null: false
    t.index ["short_url"], name: "index_shortened_urls_on_short_url", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
