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

ActiveRecord::Schema.define(version: 2019_01_28_193157) do

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.string "instructor"
    t.string "assistant"
    t.string "takeoff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gliders", force: :cascade do |t|
    t.string "type"
    t.string "size"
    t.string "manufacturer"
    t.string "image"
    t.string "color_name"
    t.string "serial_number"
    t.string "year_manufactured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "n_flights"
    t.string "shv_number"
    t.boolean "radio"
    t.string "glider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
