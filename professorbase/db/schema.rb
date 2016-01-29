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

ActiveRecord::Schema.define(version: 20151211041238) do

  create_table "interests", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "professor_id"
    t.integer  "study_area_id"
  end

  add_index "interests", ["professor_id"], name: "index_interests_on_professor_id"
  add_index "interests", ["study_area_id"], name: "index_interests_on_study_area_id"

  create_table "professors", force: :cascade do |t|
    t.string   "title"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.text     "bio"
    t.string   "profile_link"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "university_id"
    t.integer  "publications_id"
    t.integer  "interests_id"
    t.string   "name"
  end

  add_index "professors", ["interests_id"], name: "index_professors_on_interests_id"
  add_index "professors", ["publications_id"], name: "index_professors_on_publications_id"
  add_index "professors", ["university_id"], name: "index_professors_on_university_id"

  create_table "publications", force: :cascade do |t|
    t.string   "info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "professor_id"
  end

  add_index "publications", ["professor_id"], name: "index_publications_on_professor_id"

  create_table "study_areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "interests_id"
  end

  add_index "study_areas", ["interests_id"], name: "index_study_areas_on_interests_id"

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "professors_id"
    t.string   "nickname"
  end

  add_index "universities", ["professors_id"], name: "index_universities_on_professors_id"

end
