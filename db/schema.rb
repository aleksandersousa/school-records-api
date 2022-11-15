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

ActiveRecord::Schema[7.0].define(version: 2022_11_15_042705) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "college_subjects", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "workload"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_college_subjects_on_code", unique: true
    t.index ["course_id"], name: "index_college_subjects_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_courses_on_code", unique: true
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "results", id: false, force: :cascade do |t|
    t.bigint "college_subject_id", null: false
    t.bigint "user_id", null: false
    t.datetime "assign_result_date"
    t.decimal "note"
    t.bigint "type_of_result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_subject_id"], name: "index_results_on_college_subject_id"
    t.index ["type_of_result_id"], name: "index_results_on_type_of_result_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "type_of_results", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "registration_number"
    t.string "name"
    t.string "cpf"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "college_subjects", "courses"
  add_foreign_key "results", "type_of_results"
  add_foreign_key "users", "courses"
end
