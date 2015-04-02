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

ActiveRecord::Schema.define(version: 20150401085409) do

  create_table "challenge_responses", force: true do |t|
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", force: true do |t|
    t.string   "Path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", force: true do |t|
    t.string   "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "First_Name"
    t.string   "Last_Name"
    t.integer  "Age"
    t.string   "email"
    t.string   "Password"
    t.string   "Img_Path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
