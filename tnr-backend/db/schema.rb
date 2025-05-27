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

ActiveRecord::Schema[8.0].define(version: 2025_05_27_043002) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cat_contacts", force: :cascade do |t|
    t.bigint "cat_id", null: false
    t.bigint "contact_id", null: false
    t.string "relationship_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_cat_contacts_on_cat_id"
    t.index ["contact_id"], name: "index_cat_contacts_on_contact_id"
  end

  create_table "cat_locations", force: :cascade do |t|
    t.bigint "cat_id", null: false
    t.bigint "location_id", null: false
    t.datetime "first_seen"
    t.datetime "last_seen"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_cat_locations_on_cat_id"
    t.index ["location_id"], name: "index_cat_locations_on_location_id"
  end

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "color"
    t.text "description"
    t.string "status"
    t.boolean "spayed_neutered"
    t.boolean "microchipped"
    t.text "health_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "contact_type"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "health_records", force: :cascade do |t|
    t.bigint "cat_id", null: false
    t.datetime "visit_date"
    t.string "veterinarian"
    t.text "notes"
    t.text "treatment"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_health_records_on_cat_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cat_contacts", "cats"
  add_foreign_key "cat_contacts", "contacts"
  add_foreign_key "cat_locations", "cats"
  add_foreign_key "cat_locations", "locations"
  add_foreign_key "health_records", "cats"
end
