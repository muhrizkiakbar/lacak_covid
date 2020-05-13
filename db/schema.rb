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

ActiveRecord::Schema.define(version: 2020_05_13_105536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "main_cities", force: :cascade do |t|
    t.string "city"
    t.bigint "main_province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_cities_on_deleted_at"
    t.index ["main_province_id"], name: "index_main_cities_on_main_province_id"
    t.index ["slug"], name: "index_main_cities_on_slug", unique: true
  end

  create_table "main_citizen_associations", force: :cascade do |t|
    t.string "citizen_association"
    t.bigint "main_sub_district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_citizen_associations_on_deleted_at"
    t.index ["main_sub_district_id"], name: "index_main_citizen_associations_on_main_sub_district_id"
    t.index ["slug"], name: "index_main_citizen_associations_on_slug", unique: true
  end

  create_table "main_districts", force: :cascade do |t|
    t.string "district"
    t.bigint "main_city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_districts_on_deleted_at"
    t.index ["main_city_id"], name: "index_main_districts_on_main_city_id"
    t.index ["slug"], name: "index_main_districts_on_slug", unique: true
  end

  create_table "main_job_types", force: :cascade do |t|
    t.string "job_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "slug"
    t.index ["deleted_at"], name: "index_main_job_types_on_deleted_at"
    t.index ["slug"], name: "index_main_job_types_on_slug", unique: true
  end

  create_table "main_marital_statuses", force: :cascade do |t|
    t.string "marital_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_marital_statuses_on_deleted_at"
    t.index ["slug"], name: "index_main_marital_statuses_on_slug", unique: true
  end

  create_table "main_neighborhood_associations", force: :cascade do |t|
    t.string "neighborhood_association"
    t.bigint "main_citizen_association_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_neighborhood_associations_on_deleted_at"
    t.index ["main_citizen_association_id"], name: "index_m_neighborhood_assoc_on_m_citizen_assoc"
    t.index ["slug"], name: "index_main_neighborhood_associations_on_slug", unique: true
  end

  create_table "main_patients", force: :cascade do |t|
    t.bigint "main_tribe_id"
    t.bigint "main_city_id"
    t.bigint "main_district_id"
    t.bigint "main_sub_district_id"
    t.bigint "main_citizen_association_id"
    t.bigint "main_neighborhood_association_id"
    t.bigint "main_marital_status_id"
    t.string "no_identity"
    t.string "name_of_parent"
    t.string "name"
    t.text "address"
    t.string "phone_number"
    t.date "date_of_birth"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_patients_on_deleted_at"
    t.index ["main_citizen_association_id"], name: "index_main_patients_on_main_citizen_association_id"
    t.index ["main_city_id"], name: "index_main_patients_on_main_city_id"
    t.index ["main_district_id"], name: "index_main_patients_on_main_district_id"
    t.index ["main_marital_status_id"], name: "index_main_patients_on_main_marital_status_id"
    t.index ["main_neighborhood_association_id"], name: "index_main_patients_on_main_neighborhood_association_id"
    t.index ["main_sub_district_id"], name: "index_main_patients_on_main_sub_district_id"
    t.index ["main_tribe_id"], name: "index_main_patients_on_main_tribe_id"
    t.index ["slug"], name: "index_main_patients_on_slug", unique: true
  end

  create_table "main_personal_protective_equipments", force: :cascade do |t|
    t.string "personal_protective_equipment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_personal_protective_equipments_on_deleted_at"
    t.index ["slug"], name: "index_main_personal_protective_equipments_on_slug", unique: true
  end

  create_table "main_provinces", force: :cascade do |t|
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_provinces_on_deleted_at"
    t.index ["slug"], name: "index_main_provinces_on_slug", unique: true
  end

  create_table "main_sub_districts", force: :cascade do |t|
    t.string "sub_district"
    t.bigint "main_district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_sub_districts_on_deleted_at"
    t.index ["main_district_id"], name: "index_main_sub_districts_on_main_district_id"
    t.index ["slug"], name: "index_main_sub_districts_on_slug", unique: true
  end

  create_table "main_transportations", force: :cascade do |t|
    t.string "transportation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "slug"
    t.index ["deleted_at"], name: "index_main_transportations_on_deleted_at"
    t.index ["slug"], name: "index_main_transportations_on_slug", unique: true
  end

  create_table "main_tribes", force: :cascade do |t|
    t.string "tribe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "slug"
    t.index ["deleted_at"], name: "index_main_tribes_on_deleted_at"
    t.index ["slug"], name: "index_main_tribes_on_slug", unique: true
  end

  create_table "main_type_contacts", force: :cascade do |t|
    t.string "type_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "slug"
    t.index ["deleted_at"], name: "index_main_type_contacts_on_deleted_at"
    t.index ["slug"], name: "index_main_type_contacts_on_slug", unique: true
  end

  add_foreign_key "main_cities", "main_provinces"
  add_foreign_key "main_citizen_associations", "main_sub_districts"
  add_foreign_key "main_districts", "main_cities"
  add_foreign_key "main_neighborhood_associations", "main_citizen_associations"
  add_foreign_key "main_patients", "main_cities"
  add_foreign_key "main_patients", "main_citizen_associations"
  add_foreign_key "main_patients", "main_districts"
  add_foreign_key "main_patients", "main_marital_statuses"
  add_foreign_key "main_patients", "main_neighborhood_associations"
  add_foreign_key "main_patients", "main_sub_districts"
  add_foreign_key "main_patients", "main_tribes"
  add_foreign_key "main_sub_districts", "main_districts"
end
