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

ActiveRecord::Schema[8.1].define(version: 2026_01_07_083950) do
  create_table "breaks", force: :cascade do |t|
    t.string "break_type"
    t.datetime "created_at", null: false
    t.integer "duration"
    t.integer "study_session_id", null: false
    t.datetime "updated_at", null: false
    t.index ["study_session_id"], name: "index_breaks_on_study_session_id"
  end

  create_table "focus_stats", force: :cascade do |t|
    t.string "burnout_score"
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "total_study_minutes"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_focus_stats_on_user_id"
  end

  create_table "study_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "duration"
    t.datetime "end_time"
    t.datetime "start_time"
    t.string "subject"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_study_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "breaks", "study_sessions"
  add_foreign_key "focus_stats", "users"
  add_foreign_key "study_sessions", "users"
end
