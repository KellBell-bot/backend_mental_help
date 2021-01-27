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

ActiveRecord::Schema.define(version: 2021_01_25_202851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment_notes", force: :cascade do |t|
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["user_id"], name: "index_appointment_notes_on_user_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "practitioner_issues", force: :cascade do |t|
    t.bigint "practitioner_id", null: false
    t.bigint "issue_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_id"], name: "index_practitioner_issues_on_issue_id"
    t.index ["practitioner_id"], name: "index_practitioner_issues_on_practitioner_id"
  end

  create_table "practitioners", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "description"
    t.string "zip_code"
    t.string "phone"
    t.boolean "visited"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "fee"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "practitioner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["practitioner_id"], name: "index_reviews_on_practitioner_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointment_notes", "users"
  add_foreign_key "practitioner_issues", "issues"
  add_foreign_key "practitioner_issues", "practitioners"
  add_foreign_key "reviews", "practitioners"
  add_foreign_key "reviews", "users"
end
