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

ActiveRecord::Schema.define(version: 2019_11_21_232045) do

  create_table "notebooks", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["title", "user_id"], name: "index_notebooks_on_title_and_user_id", unique: true
    t.index ["user_id"], name: "index_notebooks_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notebook_id", null: false
    t.index ["notebook_id"], name: "index_notes_on_notebook_id"
    t.index ["title"], name: "index_notes_on_title_and_user_id", unique: true
  end

  create_table "quick_notes", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["title", "user_id"], name: "index_quick_notes_on_title_and_user_id", unique: true
    t.index ["user_id"], name: "index_quick_notes_on_user_id"
  end

  create_table "sent_mails", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "telephone"
    t.string "title"
    t.string "message", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sent_mails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "date_of_birth"
    t.boolean "is_female"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
