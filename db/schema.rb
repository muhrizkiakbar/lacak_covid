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

ActiveRecord::Schema.define(version: 2020_05_13_215819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lampiran_eleven_close_contact_informations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "main_patient_id"
    t.bigint "main_public_health_center_id"
    t.date "fill_in_date"
    t.date "contact_tracking_date"
    t.string "contact_with_positive_case"
    t.text "placement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lampiran_eleven_close_contact_informations_on_deleted_at"
    t.index ["main_patient_id"], name: "index_m_patient_on_l_e_close_contact_info"
    t.index ["main_public_health_center_id"], name: "index_m_public_health_ctr_on_l_e_close_contact_info"
    t.index ["slug"], name: "index_lampiran_eleven_close_contact_informations_on_slug", unique: true
    t.index ["user_id"], name: "index_lampiran_eleven_close_contact_informations_on_user_id"
  end

  create_table "lampiran_eleven_close_contacts", force: :cascade do |t|
    t.bigint "lampiran_eleven_information_expose_id"
    t.bigint "start_travel_qn_2_id"
    t.bigint "end_travel_qn_2_id"
    t.bigint "main_job_type_id"
    t.bigint "main_transportation_id"
    t.boolean "question_number_1"
    t.date "date_question_number_1"
    t.boolean "question_number_2"
    t.date "date_question_number_2"
    t.boolean "question_number_3"
    t.date "date_question_number_3"
    t.string "other_job_type"
    t.text "address_job"
    t.string "other_transportation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lampiran_eleven_close_contacts_on_deleted_at"
    t.index ["end_travel_qn_2_id"], name: "index_lampiran_eleven_close_contacts_on_end_travel_qn_2_id"
    t.index ["lampiran_eleven_information_expose_id"], name: "index_l_e_info_expose_on_l_e_close_contact"
    t.index ["main_job_type_id"], name: "index_lampiran_eleven_close_contacts_on_main_job_type_id"
    t.index ["main_transportation_id"], name: "index_lampiran_eleven_close_contacts_on_main_transportation_id"
    t.index ["slug"], name: "index_lampiran_eleven_close_contacts_on_slug", unique: true
    t.index ["start_travel_qn_2_id"], name: "index_lampiran_eleven_close_contacts_on_start_travel_qn_2_id"
  end

  create_table "lampiran_eleven_information_exposes", force: :cascade do |t|
    t.bigint "lampiran_eleven_close_contact_information_id"
    t.bigint "main_type_contact_id"
    t.bigint "main_set_location_id"
    t.string "other_type_contact"
    t.date "date_contact"
    t.time "duration_contact"
    t.string "other_set_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lampiran_eleven_information_exposes_on_deleted_at"
    t.index ["lampiran_eleven_close_contact_information_id"], name: "index_l_e_close_contact_info_on_l_e_information_expose"
    t.index ["main_set_location_id"], name: "index_m_set_location_on_l_e_information_expose"
    t.index ["main_type_contact_id"], name: "index_m_type_contact_on_l_e_information_expose"
    t.index ["slug"], name: "index_lampiran_eleven_information_exposes_on_slug", unique: true
  end

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

  create_table "main_dinkes_provinces", force: :cascade do |t|
    t.string "dinkes_province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_dinkes_provinces_on_deleted_at"
    t.index ["slug"], name: "index_main_dinkes_provinces_on_slug", unique: true
  end

  create_table "main_dinkes_regions", force: :cascade do |t|
    t.string "dinkes_region"
    t.bigint "main_dinkes_province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.bigint "main_city_id"
    t.index ["deleted_at"], name: "index_main_dinkes_regions_on_deleted_at"
    t.index ["main_city_id"], name: "index_main_dinkes_regions_on_main_city_id"
    t.index ["main_dinkes_province_id"], name: "index_main_dinkes_regions_on_main_dinkes_province_id"
    t.index ["slug"], name: "index_main_dinkes_regions_on_slug", unique: true
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

  create_table "main_hospitals", force: :cascade do |t|
    t.string "hospital"
    t.boolean "is_primary"
    t.bigint "main_dinkes_region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_hospitals_on_deleted_at"
    t.index ["main_dinkes_region_id"], name: "index_main_hospitals_on_main_dinkes_region_id"
    t.index ["slug"], name: "index_main_hospitals_on_slug", unique: true
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

  create_table "main_public_health_centers", force: :cascade do |t|
    t.string "public_health_center"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.bigint "main_sub_district_id"
    t.index ["deleted_at"], name: "index_main_public_health_centers_on_deleted_at"
    t.index ["main_sub_district_id"], name: "index_main_public_health_centers_on_main_sub_district_id"
    t.index ["slug"], name: "index_main_public_health_centers_on_slug", unique: true
  end

  create_table "main_set_locations", force: :cascade do |t|
    t.string "set_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_set_locations_on_deleted_at"
    t.index ["slug"], name: "index_main_set_locations_on_slug", unique: true
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

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.string "resource"
    t.string "action"
    t.string "path"
    t.string "description"
    t.boolean "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_permissions_on_deleted_at"
    t.index ["slug"], name: "index_permissions_on_slug", unique: true
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_roles_on_deleted_at"
    t.index ["slug"], name: "index_roles_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "main_dinkes_province_id"
    t.bigint "main_dinkes_region_id"
    t.bigint "main_hospital_id"
    t.bigint "main_public_health_center_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.bigint "role_id"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["main_dinkes_province_id"], name: "index_users_on_main_dinkes_province_id"
    t.index ["main_dinkes_region_id"], name: "index_users_on_main_dinkes_region_id"
    t.index ["main_hospital_id"], name: "index_users_on_main_hospital_id"
    t.index ["main_public_health_center_id"], name: "index_users_on_main_public_health_center_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "lampiran_eleven_close_contact_informations", "main_patients"
  add_foreign_key "lampiran_eleven_close_contact_informations", "main_public_health_centers"
  add_foreign_key "lampiran_eleven_close_contact_informations", "users"
  add_foreign_key "lampiran_eleven_close_contacts", "lampiran_eleven_information_exposes"
  add_foreign_key "lampiran_eleven_close_contacts", "main_cities", column: "end_travel_qn_2_id"
  add_foreign_key "lampiran_eleven_close_contacts", "main_cities", column: "start_travel_qn_2_id"
  add_foreign_key "lampiran_eleven_close_contacts", "main_job_types"
  add_foreign_key "lampiran_eleven_close_contacts", "main_transportations"
  add_foreign_key "lampiran_eleven_information_exposes", "lampiran_eleven_close_contact_informations"
  add_foreign_key "lampiran_eleven_information_exposes", "main_set_locations"
  add_foreign_key "lampiran_eleven_information_exposes", "main_type_contacts"
  add_foreign_key "main_cities", "main_provinces"
  add_foreign_key "main_citizen_associations", "main_sub_districts"
  add_foreign_key "main_dinkes_regions", "main_cities"
  add_foreign_key "main_dinkes_regions", "main_dinkes_provinces"
  add_foreign_key "main_districts", "main_cities"
  add_foreign_key "main_hospitals", "main_dinkes_regions"
  add_foreign_key "main_neighborhood_associations", "main_citizen_associations"
  add_foreign_key "main_patients", "main_cities"
  add_foreign_key "main_patients", "main_citizen_associations"
  add_foreign_key "main_patients", "main_districts"
  add_foreign_key "main_patients", "main_marital_statuses"
  add_foreign_key "main_patients", "main_neighborhood_associations"
  add_foreign_key "main_patients", "main_sub_districts"
  add_foreign_key "main_patients", "main_tribes"
  add_foreign_key "main_public_health_centers", "main_sub_districts"
  add_foreign_key "main_sub_districts", "main_districts"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "users", "main_dinkes_provinces"
  add_foreign_key "users", "main_dinkes_regions"
  add_foreign_key "users", "main_hospitals"
  add_foreign_key "users", "main_public_health_centers"
  add_foreign_key "users", "roles"
end
