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

ActiveRecord::Schema.define(version: 20140218231102) do

  create_table "answers", force: true do |t|
    t.datetime "date"
    t.string   "ipaddress"
    t.integer  "choice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "participant_id"
  end

  add_index "answers", ["choice_id"], name: "index_answers_on_choice_id"

  create_table "choices", force: true do |t|
    t.string   "choice"
    t.boolean  "correct"
    t.string   "explaination"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id"

  create_table "days", force: true do |t|
    t.string   "dayname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.string   "email"
    t.boolean  "subscribed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prizes", force: true do |t|
    t.string   "pictureurl"
    t.string   "promocode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "question"
    t.integer  "day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num"
  end

  add_index "questions", ["day_id"], name: "index_questions_on_day_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "winners", force: true do |t|
    t.integer  "participant_id"
    t.integer  "price_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
