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

ActiveRecord::Schema[7.0].define(version: 2022_12_11_135722) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "variable_type", ["text", "constant", "interval", "list"]

  create_table "answers", force: :cascade do |t|
    t.string "name"
    t.text "value"
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
    t.string "name"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variables", force: :cascade do |t|
    t.string "name"
    t.text "value"
    t.enum "variable_type", default: "text", null: false, enum_type: "variable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
