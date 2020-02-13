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

ActiveRecord::Schema.define(version: 2020_02_12_035507) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "kana_family_name", null: false
    t.string "kana_first_name", null: false
    t.date "birthday", null: false
    t.integer "telnumber", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["birthday"], name: "index_users_on_birthday", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["family_name"], name: "index_users_on_family_name", unique: true
    t.index ["first_name"], name: "index_users_on_first_name", unique: true
    t.index ["kana_family_name"], name: "index_users_on_kana_family_name", unique: true
    t.index ["kana_first_name"], name: "index_users_on_kana_first_name", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["telnumber"], name: "index_users_on_telnumber", unique: true
  end

end
