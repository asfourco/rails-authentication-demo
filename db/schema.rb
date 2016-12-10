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

ActiveRecord::Schema.define(version: 20161208045724) do

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "last_updated"
    t.datetime "account_closed"
    t.datetime "last_login"
    t.datetime "last_failed_login"
    t.datetime "password_changed"
    t.datetime "last_failed_password_reset"
    t.datetime "verification_key_sent"
    t.boolean  "is_login_allowed"
    t.boolean  "requires_password_reset"
    t.boolean  "is_account_verified"
    t.integer  "failed_login_count"
    t.integer  "failed_password_reset_count"
    t.integer  "verification_purpose"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
