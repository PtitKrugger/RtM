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

ActiveRecord::Schema[7.0].define(version: 2023_06_07_083600) do
  create_table "etats", force: :cascade do |t|
    t.string "etat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importances", force: :cascade do |t|
    t.string "descriptif"
    t.string "codecouleur"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taches", force: :cascade do |t|
    t.string "descriptif"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "importance_id"
    t.datetime "date_prevue"
    t.integer "etat_id", default: 2
  end

  add_foreign_key "taches", "etats"
  add_foreign_key "taches", "importances"
  add_foreign_key "taches", "importances"
end
