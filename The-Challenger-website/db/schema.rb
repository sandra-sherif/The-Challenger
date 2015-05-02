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

ActiveRecord::Schema.define(version: 20150430202436) do

  create_table "challenge_responses", force: :cascade do |t|
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

#Haya Borham - schema got automatically udated with new column description for Challenges
  create_table "challenges", force: :cascade do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "user1_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload_type"
    t.integer  "likes_number", default: 0
    t.string   "description"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["challenge_id"], name: "index_comments_on_challenge_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "friends", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sent_by"
    t.string   "sent_to"
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "path"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "sent_by"
    t.integer  "sent_to"
    t.integer  "challenge_id"
    t.integer  "comment_id"
    t.string   "text"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "seen",              default: false
    t.string   "notification_type"
    t.integer  "response_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.string   "reason"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

#Haya Borham - schema got automatically udated with new column description for Responses
  create_table "responses", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "challenge_owner"
    t.string   "name"
    t.string   "path"
    t.integer  "user_id"
    t.string   "upload_type"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "likes_number",    default: 0
    t.string   "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "admin",                  default: false
    t.integer  "notifications",          default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
