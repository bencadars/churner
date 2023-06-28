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

ActiveRecord::Schema[7.0].define(version: 2023_06_26_150528) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "receiver_id", null: false
    t.bigint "survey_id", null: false
    t.bigint "question_id", null: false
    t.text "text"
    t.boolean "boolean"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["receiver_id"], name: "index_answers_on_receiver_id"
    t.index ["survey_id"], name: "index_answers_on_survey_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "text"
    t.boolean "boolean"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receivers", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_receivers_on_survey_id"
    t.index ["user_id"], name: "index_receivers_on_user_id"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_survey_questions_on_question_id"
    t.index ["survey_id"], name: "index_survey_questions_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "anonymous"
    t.string "status", default: "draft", null: false
    t.bigint "user_id", null: false
    t.bigint "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_surveys_on_template_id"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "template_questions", force: :cascade do |t|
    t.bigint "template_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_template_questions_on_question_id"
    t.index ["template_id"], name: "index_template_questions_on_template_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "type_of_departure"
    t.date "date_of_integration"
    t.date "date_of_departure"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "receivers"
  add_foreign_key "answers", "surveys"
  add_foreign_key "receivers", "surveys"
  add_foreign_key "receivers", "users"
  add_foreign_key "survey_questions", "questions"
  add_foreign_key "survey_questions", "surveys"
  add_foreign_key "surveys", "templates"
  add_foreign_key "surveys", "users"
  add_foreign_key "template_questions", "questions"
  add_foreign_key "template_questions", "templates"
end
