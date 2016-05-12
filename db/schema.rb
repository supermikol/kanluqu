# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160512182913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admits", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "application_id"
    t.boolean  "admitted"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "applications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "student_name"
    t.string   "major"
    t.string   "location"
    t.string   "gender"
    t.integer  "year"
    t.boolean  "study_abroad"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "note"
  end

  add_index "applications", ["user_id"], name: "index_applications_on_user_id", using: :btree

  create_table "essays", force: :cascade do |t|
    t.integer  "application_id"
    t.integer  "prompt_id"
    t.string   "category"
    t.text     "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "title"
  end

  add_index "essays", ["application_id"], name: "index_essays_on_application_id", using: :btree
  add_index "essays", ["prompt_id"], name: "index_essays_on_prompt_id", using: :btree

  create_table "extracurriculars", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "name"
    t.string   "category"
    t.string   "position"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "description"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "favoritable_id"
    t.string   "favoritable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "favorites", ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id", using: :btree

  create_table "prompts", force: :cascade do |t|
    t.integer  "school_id"
    t.text     "content"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "rank"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_scores", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "category"
    t.string   "subject"
    t.integer  "score"
    t.date     "date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",              default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "contributor",            default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
