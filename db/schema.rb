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

ActiveRecord::Schema.define(version: 20150129212027) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street",           limit: 255
    t.string   "city",             limit: 255
    t.string   "state",            limit: 255
    t.string   "country",          limit: 255
    t.integer  "addressable_id",   limit: 4
    t.string   "addressable_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "references", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "relation_to_student", limit: 255
    t.integer  "date",                limit: 4
    t.string   "content",             limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "application_deadline", limit: 255
    t.integer  "average_sat",          limit: 4
    t.integer  "average_act",          limit: 4
    t.string   "school_name",          limit: 255
    t.integer  "student_population",   limit: 4
    t.string   "city",                 limit: 255
    t.string   "state",                limit: 255
    t.string   "comment",              limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.integer  "zip",        limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "test_scores", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "score",      limit: 255
    t.string   "date_taken", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "test_type",  limit: 255
    t.string   "score",      limit: 255
    t.date     "date_taken"
    t.integer  "student_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tests", ["student_id"], name: "index_tests_on_student_id", using: :btree

  add_foreign_key "tests", "students"
end
