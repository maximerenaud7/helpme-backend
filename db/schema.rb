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

ActiveRecord::Schema[7.0].define(version: 2023_01_15_112339) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "display_name"
    t.text "html"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercise_answers", force: :cascade do |t|
    t.bigint "exercise_id"
    t.bigint "answer_id"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_exercise_answers_on_answer_id"
    t.index ["exercise_id"], name: "index_exercise_answers_on_exercise_id"
  end

  create_table "exercise_variables", force: :cascade do |t|
    t.bigint "exercise_id"
    t.bigint "variable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_variables_on_exercise_id"
    t.index ["variable_id"], name: "index_exercise_variables_on_variable_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "display_name"
    t.text "html"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occurences", force: :cascade do |t|
    t.bigint "exercise_id"
    t.bigint "answer_id"
    t.bigint "variable_id"
    t.integer "occurence_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_occurences_on_answer_id"
    t.index ["exercise_id"], name: "index_occurences_on_exercise_id"
    t.index ["variable_id"], name: "index_occurences_on_variable_id"
  end

  create_table "variables", force: :cascade do |t|
    t.string "slug"
    t.string "display_name"
    t.text "value"
    t.integer "variable_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
