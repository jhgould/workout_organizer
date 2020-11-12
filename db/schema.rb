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

ActiveRecord::Schema.define(version: 2020_11_12_223930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.bigint "week_id"
    t.index ["week_id"], name: "index_days_on_week_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "category"
    t.string "muscle_group"
    t.string "name"
    t.integer "sets"
    t.integer "reps"
    t.integer "rest_time"
    t.integer "weight"
    t.bigint "day_id"
    t.index ["day_id"], name: "index_exercises_on_day_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

  create_table "weeks", force: :cascade do |t|
    t.string "name"
    t.bigint "workout_id"
    t.index ["workout_id"], name: "index_weeks_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "days", "weeks"
  add_foreign_key "exercises", "days"
  add_foreign_key "weeks", "workouts"
  add_foreign_key "workouts", "users"
end
