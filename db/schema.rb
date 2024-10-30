# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_29_120828) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "course_id"
    t.string "title"
    t.text "description"
    t.decimal "assignment_1"
    t.decimal "assignment_2"
    t.decimal "assignment_3"
    t.decimal "exam"
    t.decimal "test"
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "course_id", null: false
    t.date "date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_attendances_on_course_id"
    t.index ["users_id"], name: "index_attendances_on_users_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.string "status"
    t.datetime "enrolled_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.decimal "grade_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.integer "assignment_id"
    t.integer "student_id"
    t.datetime "submission_date", precision: nil
    t.decimal "grade"
    t.text "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone_number"
    t.date "date_of_birth"
    t.string "nationality"
    t.string "gender"
    t.string "student_grade_level"
    t.string "student_course_enrolled"
    t.string "password_digest"
  end

  add_foreign_key "attendances", "courses"
  add_foreign_key "attendances", "users", column: "users_id"
end
