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

ActiveRecord::Schema.define(version: 2020_01_31_155804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_flights", force: :cascade do |t|
    t.date "date"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "day_id"
    t.integer "student_id"
    t.integer "glider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.date "date", null: false
    t.string "instructor", null: false
    t.string "assistant"
    t.string "takeoff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string "manoeuvres"
    t.string "notes"
    t.integer "attendance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gliders", force: :cascade do |t|
    t.string "glider_type", null: false
    t.string "size"
    t.string "manufacturer"
    t.string "color"
    t.string "serial_number"
    t.integer "year_manufactured"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color_background"
    t.string "color_arc"
    t.string "color_oval"
  end

  create_table "licences", force: :cascade do |t|
    t.date "acquired_on"
    t.date "expires_on"
    t.string "country"
    t.string "licence_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "middle_name"
    t.integer "additional_flights", default: 0, null: false
    t.string "shv_number"
    t.boolean "radio", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "additional_flights", "students"
  add_foreign_key "attendances", "days"
  add_foreign_key "attendances", "students"
  add_foreign_key "flights", "attendances"
  add_foreign_key "gliders", "students"
  add_foreign_key "licences", "students"
end
