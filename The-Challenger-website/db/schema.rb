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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150402210231) do

  create_table "challenge_responses", force: true do |t|
=======
ActiveRecord::Schema.define(version: 20150402075905) do

  create_table "challenge_responses", force: :cascade do |t|
>>>>>>> 54d0329f768ec500c21ed1302fd475e76c66a5b3
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
  create_table "challenges", force: true do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "user1_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload_type"
  end

  create_table "comments", force: true do |t|
=======
  create_table "challenges", force: :cascade do |t|
    t.string   "Path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
>>>>>>> 54d0329f768ec500c21ed1302fd475e76c66a5b3
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
  create_table "friends", force: true do |t|
    t.string   "status"
=======
  create_table "friends", force: :cascade do |t|
    t.string   "Status"
>>>>>>> 54d0329f768ec500c21ed1302fd475e76c66a5b3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
  create_table "likes", force: true do |t|
=======
  create_table "likes", force: :cascade do |t|
>>>>>>> 54d0329f768ec500c21ed1302fd475e76c66a5b3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
  create_table "users", force: true do |t|
=======
  create_table "users", force: :cascade do |t|
>>>>>>> 54d0329f768ec500c21ed1302fd475e76c66a5b3
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
=======
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "img_path"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
>>>>>>> 54d0329f768ec500c21ed1302fd475e76c66a5b3
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
