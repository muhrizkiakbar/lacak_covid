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

ActiveRecord::Schema.define(version: 2020_05_23_094302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "l_six_f_aboard_dests", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.date "travel_date"
    t.date "date_arrive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_l_six_f_aboard_dests_on_deleted_at"
    t.index ["slug"], name: "index_l_six_f_aboard_dests_on_slug", unique: true
  end

  create_table "l_six_f_animal_dests", force: :cascade do |t|
    t.string "location"
    t.string "city"
    t.date "visit_date"
    t.string "province_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_l_six_f_animal_dests_on_deleted_at"
    t.index ["slug"], name: "index_l_six_f_animal_dests_on_slug", unique: true
  end

  create_table "l_six_f_hospital_dests", force: :cascade do |t|
    t.string "hospital"
    t.string "city"
    t.date "visit_date"
    t.string "province_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_l_six_f_hospital_dests_on_deleted_at"
    t.index ["slug"], name: "index_l_six_f_hospital_dests_on_slug", unique: true
  end

  create_table "l_six_f_out_town_dests", force: :cascade do |t|
    t.string "province"
    t.string "city"
    t.date "travel_date"
    t.date "date_arrive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_l_six_f_out_town_dests_on_deleted_at"
    t.index ["slug"], name: "index_l_six_f_out_town_dests_on_slug", unique: true
  end

  create_table "l_six_f_pdp_dests", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "relation"
    t.date "date_contact"
    t.date "last_date_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_l_six_f_pdp_dests_on_deleted_at"
    t.index ["slug"], name: "index_l_six_f_pdp_dests_on_slug", unique: true
  end

  create_table "l_six_f_positive_dests", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "relation"
    t.date "date_contact"
    t.date "last_date_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_l_six_f_positive_dests_on_deleted_at"
    t.index ["slug"], name: "index_l_six_f_positive_dests_on_slug", unique: true
  end

  create_table "l_six_fifths", force: :cascade do |t|
    t.bigint "l_six_first_id"
    t.string "name"
    t.date "date_of_birth"
    t.string "gender"
    t.string "relation"
    t.text "address"
    t.string "phone_number"
    t.text "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_l_six_fifths_on_deleted_at"
    t.index ["l_six_first_id"], name: "index_l_six_fifths_on_l_six_first_id"
    t.index ["slug"], name: "index_l_six_fifths_on_slug", unique: true
  end

  create_table "l_six_firsts", force: :cascade do |t|
    t.bigint "main_patient_id"
    t.bigint "user_id"
    t.date "interview_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "slug"
    t.string "job"
    t.index ["deleted_at"], name: "index_l_six_firsts_on_deleted_at"
    t.index ["main_patient_id"], name: "index_l_six_firsts_on_main_patient_id"
    t.index ["slug"], name: "index_l_six_firsts_on_slug", unique: true
    t.index ["user_id"], name: "index_l_six_firsts_on_user_id"
  end

  create_table "l_six_fourths", force: :cascade do |t|
    t.bigint "l_six_first_id"
    t.decimal "abroad"
    t.decimal "out_town"
    t.decimal "hospital"
    t.decimal "animal_market"
    t.decimal "contact_pdp"
    t.decimal "contact_positive"
    t.decimal "ispa_chronic"
    t.decimal "medic_officer"
    t.text "explain_of_procedure_alcohol"
    t.boolean "is_goggle"
    t.boolean "isn_apd"
    t.boolean "is_n99_ffp3"
    t.boolean "is_n95_ffp2"
    t.boolean "is_gloves"
    t.boolean "is_medic_mask"
    t.boolean "is_gown"
    t.boolean "is_procedure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_l_six_fourths_on_deleted_at"
    t.index ["l_six_first_id"], name: "index_l_six_fourths_on_l_six_first_id"
    t.index ["slug"], name: "index_l_six_fourths_on_slug", unique: true
  end

  create_table "l_six_seconds", force: :cascade do |t|
    t.bigint "l_six_first_id"
    t.bigint "main_hospital_id"
    t.date "since_date_symptom"
    t.decimal "fever_temperature"
    t.boolean "history_fever"
    t.decimal "cough"
    t.decimal "cold"
    t.decimal "sore_throat"
    t.decimal "headache"
    t.decimal "weak"
    t.decimal "muscle_ache"
    t.decimal "nausea_vomitting"
    t.decimal "abdominal_pain"
    t.decimal "diarrhea"
    t.string "other_symptom"
    t.boolean "is_pregnant"
    t.boolean "is_diabetes"
    t.boolean "is_heart_disease"
    t.boolean "is_hypertention"
    t.boolean "is_malignancy"
    t.boolean "is_kidney_disease"
    t.boolean "is_liver_disease"
    t.boolean "is_immune_disease"
    t.boolean "is_ppok"
    t.string "other_condition"
    t.boolean "is_being_treated_hospital"
    t.date "last_date_hospital"
    t.string "room_treated"
    t.boolean "is_treated_icu"
    t.boolean "is_intubation"
    t.boolean "is_emco"
    t.text "last_hospital"
    t.string "last_status_patient"
    t.date "date_of_die"
    t.decimal "pneumonia"
    t.decimal "ardc"
    t.text "other_diagnose"
    t.decimal "have_etiologi"
    t.text "explain_etiologi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "slug"
    t.decimal "out_of_breath"
    t.index ["deleted_at"], name: "index_l_six_seconds_on_deleted_at"
    t.index ["l_six_first_id"], name: "index_l_six_seconds_on_l_six_first_id"
    t.index ["main_hospital_id"], name: "index_l_six_seconds_on_main_hospital_id"
    t.index ["slug"], name: "index_l_six_seconds_on_slug", unique: true
  end

  create_table "l_six_t_checkothers", force: :cascade do |t|
    t.bigint "l_six_third_id"
    t.string "other_check"
    t.date "date_check_other"
    t.string "place_check_other"
    t.text "result_check_other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_l_six_t_checkothers_on_deleted_at"
    t.index ["l_six_third_id"], name: "index_l_six_t_checkothers_on_l_six_third_id"
    t.index ["slug"], name: "index_l_six_t_checkothers_on_slug", unique: true
  end

  create_table "l_six_thirds", force: :cascade do |t|
    t.date "date_nasopharyngeal"
    t.string "place_nasopharyngeal"
    t.text "result_nasopharyngeal"
    t.date "date_oropharyngeal"
    t.string "place_oropharyngeal"
    t.text "result_oropharyngeal"
    t.date "date_sputum"
    t.string "place_sputum"
    t.text "result_sputum"
    t.date "date_serum"
    t.string "place_serum"
    t.text "result_serum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.bigint "l_six_first_id"
    t.index ["deleted_at"], name: "index_l_six_thirds_on_deleted_at"
    t.index ["l_six_first_id"], name: "index_l_six_thirds_on_l_six_first_id"
    t.index ["slug"], name: "index_l_six_thirds_on_slug", unique: true
  end

  create_table "lampiran_eleven_close_contact_info_homes", force: :cascade do |t|
    t.bigint "lampiran_eleven_information_expose_id"
    t.text "address_close_contact_primer"
    t.date "last_date_close_contact_primer"
    t.boolean "is_room_contact_or_activity"
    t.integer "number_of_days_of_contact_activity"
    t.boolean "is_treating_primary_case"
    t.boolean "is_hugging_the_primary_case"
    t.boolean "is_primary_case_shake"
    t.boolean "is_drink_using_the_same_place"
    t.boolean "is_use_the_same_toilet"
    t.boolean "is_kiss_the_primary_case"
    t.boolean "is_sleep_in_the_same_room"
    t.boolean "is_eat_using_the_same_place"
    t.boolean "is_using_the_same_equipment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.boolean "is_share_food"
    t.index ["deleted_at"], name: "index_lampiran_eleven_close_contact_info_homes_on_deleted_at"
    t.index ["lampiran_eleven_information_expose_id"], name: "index_l_e_info_expose_on_l_e_close_contact_info_home"
    t.index ["slug"], name: "index_lampiran_eleven_close_contact_info_homes_on_slug", unique: true
  end

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
    t.string "answer_qn_1"
    t.index ["deleted_at"], name: "index_lampiran_eleven_close_contacts_on_deleted_at"
    t.index ["end_travel_qn_2_id"], name: "index_lampiran_eleven_close_contacts_on_end_travel_qn_2_id"
    t.index ["lampiran_eleven_information_expose_id"], name: "index_l_e_info_expose_on_l_e_close_contact"
    t.index ["main_job_type_id"], name: "index_lampiran_eleven_close_contacts_on_main_job_type_id"
    t.index ["main_transportation_id"], name: "index_lampiran_eleven_close_contacts_on_main_transportation_id"
    t.index ["slug"], name: "index_lampiran_eleven_close_contacts_on_slug", unique: true
    t.index ["start_travel_qn_2_id"], name: "index_lampiran_eleven_close_contacts_on_start_travel_qn_2_id"
  end

  create_table "lampiran_eleven_comorbid_conditions", force: :cascade do |t|
    t.bigint "lampiran_eleven_close_contact_information_id"
    t.boolean "is_cancer"
    t.boolean "is_diabetes"
    t.boolean "is_ppok"
    t.boolean "is_hiv"
    t.boolean "is_liver"
    t.boolean "is_obesity"
    t.boolean "is_asthma"
    t.boolean "is_blood_disorder"
    t.boolean "is_heart_disease"
    t.boolean "is_kidney"
    t.boolean "is_neurology"
    t.boolean "is_organ_donor_recipient"
    t.boolean "is_pregnant"
    t.boolean "is_first_semester_pregnant"
    t.boolean "is_second_semester_pregnant"
    t.boolean "is_third_semester_pregnant"
    t.date "estimated_birth"
    t.boolean "is_influenza_vaccine"
    t.date "date_of_influenza_vaccine"
    t.string "influenza_vaccine_in_the_country"
    t.boolean "is_pvc_vaccine"
    t.date "date_of_pvc_vaccine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lampiran_eleven_comorbid_conditions_on_deleted_at"
    t.index ["lampiran_eleven_close_contact_information_id"], name: "index_l_e_close_contact_info_on_l_e_comorbid_condition"
    t.index ["slug"], name: "index_lampiran_eleven_comorbid_conditions_on_slug", unique: true
  end

  create_table "lampiran_eleven_contact_statuses", force: :cascade do |t|
    t.bigint "lampiran_eleven_close_contact_information_id"
    t.string "status_patient"
    t.date "date_of_status_recovered"
    t.date "date_of_status_died"
    t.boolean "is_been_treated"
    t.date "start_date_of_treated"
    t.date "end_date_of_treated"
    t.boolean "is_dead_with_autopsy"
    t.text "result_of_autopsy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lampiran_eleven_contact_statuses_on_deleted_at"
    t.index ["lampiran_eleven_close_contact_information_id"], name: "index_l_e_close_contact_info_on_l_e_contact_status"
    t.index ["slug"], name: "index_lampiran_eleven_contact_statuses_on_slug", unique: true
  end

  create_table "lampiran_eleven_contact_symptoms", force: :cascade do |t|
    t.bigint "lampiran_eleven_info_exposes_officer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.boolean "is_contact_experiencing_pain"
    t.boolean "is_fever"
    t.boolean "is_ili"
    t.text "explain_of_fever"
    t.date "date_of_symptom"
    t.boolean "status_asymptomatic"
    t.index ["deleted_at"], name: "index_lampiran_eleven_contact_symptoms_on_deleted_at"
    t.index ["lampiran_eleven_info_exposes_officer_id"], name: "index_l_e_info_exposes_officer_on_l_e_contact_symptom"
    t.index ["slug"], name: "index_lampiran_eleven_contact_symptoms_on_slug", unique: true
  end

  create_table "lampiran_eleven_info_exposes_officers", force: :cascade do |t|
    t.bigint "lampiran_eleven_close_contact_information_id"
    t.bigint "main_dinkes_province_id"
    t.bigint "main_dinkes_region_id"
    t.bigint "main_hospital_id"
    t.bigint "main_public_health_center_id"
    t.boolean "is_contact_physic_with_positive"
    t.boolean "is_procedure_aerosol"
    t.text "explain_of_procedure_aerosol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.bigint "main_job_position_id"
    t.boolean "is_gown_self"
    t.boolean "is_medic_mask_self"
    t.boolean "is_gloves_self"
    t.boolean "is_n95_ffp2_self"
    t.boolean "is_n99_ffp3_self"
    t.boolean "is_goggle_self"
    t.boolean "isn_apd_self"
    t.boolean "is_gown_aerosol"
    t.boolean "is_medic_mask_aerosol"
    t.boolean "is_gloves_aerosol"
    t.boolean "is_n95_ffp2_aerosol"
    t.boolean "is_n99_ffp3_aerosol"
    t.boolean "is_goggle_aerosol"
    t.boolean "isn_apd_aerosol"
    t.index ["deleted_at"], name: "index_lampiran_eleven_info_exposes_officers_on_deleted_at"
    t.index ["lampiran_eleven_close_contact_information_id"], name: "index_l_e_close_contact_info_on_l_e_info_exposes_officer"
    t.index ["main_dinkes_province_id"], name: "index_m_dinkes_province_on_l_e_info_exposes_officer"
    t.index ["main_dinkes_region_id"], name: "index_m_dinkes_region_on_l_e_info_exposes_officer"
    t.index ["main_hospital_id"], name: "index_m_hospital_on_l_e_info_exposes_officer"
    t.index ["main_job_position_id"], name: "index_m_job_position_on_l_e_info_exposes_officer"
    t.index ["main_public_health_center_id"], name: "index_m_public_health_center_on_l_e_info_exposes_officer"
    t.index ["slug"], name: "index_lampiran_eleven_info_exposes_officers_on_slug", unique: true
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

  create_table "lampiran_eleven_other_symptoms", force: :cascade do |t|
    t.bigint "lampiran_eleven_info_exposes_officer_id"
    t.boolean "is_shivering"
    t.boolean "is_nausea"
    t.boolean "is_convulsions"
    t.boolean "is_fatigue"
    t.boolean "is_headache"
    t.boolean "is_joint_pain"
    t.boolean "is_muscleache"
    t.boolean "is_throw_up"
    t.boolean "is_diarrhea"
    t.boolean "is_rash"
    t.boolean "is_conjuctivitis"
    t.boolean "is_bloody_nose"
    t.boolean "is_loss_of_consciousness"
    t.boolean "is_loss_of_appetite"
    t.boolean "is_neurologis"
    t.text "tell_of_neurologis"
    t.text "other_symptom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.boolean "is_weak"
    t.index ["deleted_at"], name: "index_lampiran_eleven_other_symptoms_on_deleted_at"
    t.index ["lampiran_eleven_info_exposes_officer_id"], name: "index_l_e_info_exposes_officer_on_l_e_other_symptom"
    t.index ["slug"], name: "index_lampiran_eleven_other_symptoms_on_slug", unique: true
  end

  create_table "lampiran_eleven_respiratory_symptoms", force: :cascade do |t|
    t.bigint "lampiran_eleven_info_exposes_officer_id"
    t.boolean "is_sore_throat"
    t.date "date_of_sore_throat"
    t.boolean "is_cough"
    t.date "date_of_cough"
    t.boolean "is_flu"
    t.date "date_of_flu"
    t.boolean "is_out_of_breath"
    t.date "date_of_out_of_breath"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lampiran_eleven_respiratory_symptoms_on_deleted_at"
    t.index ["lampiran_eleven_info_exposes_officer_id"], name: "index_l_e_info_exposes_officer_on_l_e_respiratory_symptom"
    t.index ["slug"], name: "index_lampiran_eleven_respiratory_symptoms_on_slug", unique: true
  end

  create_table "lampiran_eleven_specimen_contacts", force: :cascade do |t|
    t.bigint "lampiran_eleven_close_contact_information_id"
    t.string "type_of_specimen"
    t.date "date_of_specimen_collection"
    t.text "laboratory_examination_results"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lampiran_eleven_specimen_contacts_on_deleted_at"
    t.index ["lampiran_eleven_close_contact_information_id"], name: "index_l_e_close_contact_info_on_l_e_specimen_contact"
    t.index ["slug"], name: "index_lampiran_eleven_specimen_contacts_on_slug", unique: true
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

  create_table "main_job_positions", force: :cascade do |t|
    t.string "job_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_main_job_positions_on_deleted_at"
    t.index ["slug"], name: "index_main_job_positions_on_slug", unique: true
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
    t.bigint "main_city_id"
    t.bigint "main_district_id"
    t.bigint "main_sub_district_id"
    t.bigint "main_citizen_association_id"
    t.bigint "main_neighborhood_association_id"
    t.bigint "main_marital_status_id"
    t.string "name_of_parent"
    t.text "address"
    t.string "phone_number"
    t.date "date_of_birth"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.string "encrypted_no_identity"
    t.string "encrypted_no_identity_iv"
    t.string "encrypted_name"
    t.string "encrypted_name_iv"
    t.index ["deleted_at"], name: "index_main_patients_on_deleted_at"
    t.index ["encrypted_name_iv"], name: "index_main_patients_on_encrypted_name_iv", unique: true
    t.index ["encrypted_no_identity_iv"], name: "index_main_patients_on_encrypted_no_identity_iv", unique: true
    t.index ["gender"], name: "index_main_patients_on_gender"
    t.index ["main_citizen_association_id"], name: "index_main_patients_on_main_citizen_association_id"
    t.index ["main_city_id"], name: "index_main_patients_on_main_city_id"
    t.index ["main_district_id"], name: "index_main_patients_on_main_district_id"
    t.index ["main_marital_status_id"], name: "index_main_patients_on_main_marital_status_id"
    t.index ["main_neighborhood_association_id"], name: "index_main_patients_on_main_neighborhood_association_id"
    t.index ["main_sub_district_id"], name: "index_main_patients_on_main_sub_district_id"
    t.index ["slug"], name: "index_main_patients_on_slug", unique: true
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
    t.bigint "main_dinkes_region_id"
    t.index ["deleted_at"], name: "index_main_public_health_centers_on_deleted_at"
    t.index ["main_dinkes_region_id"], name: "index_main_public_health_centers_on_main_dinkes_region_id"
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
    t.boolean "is_show_to_all"
    t.index ["deleted_at"], name: "index_roles_on_deleted_at"
    t.index ["slug"], name: "index_roles_on_slug", unique: true
  end

  create_table "telegram_chat_observers", force: :cascade do |t|
    t.string "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "telegram_username_observer_id"
    t.index ["chat_id"], name: "index_telegram_chat_observers_on_chat_id", unique: true
    t.index ["telegram_username_observer_id"], name: "index_telegram_chat_observers_on_telegram_username_observer_id"
  end

  create_table "telegram_chat_reporters", force: :cascade do |t|
    t.bigint "telegram_username_reporter_id"
    t.string "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_telegram_chat_reporters_on_chat_id", unique: true
    t.index ["telegram_username_reporter_id"], name: "index_telegram_chat_reporters_on_telegram_username_reporter_id"
  end

  create_table "telegram_message_checkin_reporters", force: :cascade do |t|
    t.bigint "telegram_username_reporter_id"
    t.string "chat_id"
    t.string "username_telegram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_telegram_message_checkin_reporters_on_deleted_at"
    t.index ["slug"], name: "index_telegram_message_checkin_reporters_on_slug", unique: true
    t.index ["telegram_username_reporter_id"], name: "index_t_username_reporter_on_t_message_checkin_reporter"
  end

  create_table "telegram_message_closecont_observers", force: :cascade do |t|
    t.bigint "telegram_username_observer_id"
    t.string "chat_id"
    t.string "username_telegram"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_telegram_message_closecont_observers_on_deleted_at"
    t.index ["slug"], name: "index_telegram_message_closecont_observers_on_slug", unique: true
    t.index ["telegram_username_observer_id"], name: "index_t_username_reporter_on_t_message_closecont_observer"
  end

  create_table "telegram_message_closecont_reporters", force: :cascade do |t|
    t.bigint "telegram_username_reporter_id"
    t.string "chat_id"
    t.string "username_telegram"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_telegram_message_closecont_reporters_on_deleted_at"
    t.index ["slug"], name: "index_telegram_message_closecont_reporters_on_slug", unique: true
    t.index ["telegram_username_reporter_id"], name: "index_t_username_reporter_on_t_message_closecont_reporter"
  end

  create_table "telegram_message_ili_observers", force: :cascade do |t|
    t.bigint "telegram_username_observer_id"
    t.string "chat_id"
    t.string "username_telegram"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "slug"
    t.index ["deleted_at"], name: "index_telegram_message_ili_observers_on_deleted_at"
    t.index ["slug"], name: "index_telegram_message_ili_observers_on_slug", unique: true
    t.index ["telegram_username_observer_id"], name: "index_t_username_observer_on_t_message_ili_observer"
  end

  create_table "telegram_message_ili_reporters", force: :cascade do |t|
    t.bigint "telegram_username_reporter_id"
    t.string "chat_id"
    t.string "username_telegram"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "slug"
    t.index ["deleted_at"], name: "index_telegram_message_ili_reporters_on_deleted_at"
    t.index ["slug"], name: "index_telegram_message_ili_reporters_on_slug", unique: true
    t.index ["telegram_username_reporter_id"], name: "index_t_username_reporter_on_t_message_ili_reporter"
  end

  create_table "telegram_message_report_observers", force: :cascade do |t|
    t.bigint "telegram_username_observer_id"
    t.string "chat_id"
    t.string "username_telegram"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_telegram_message_report_observers_on_deleted_at"
    t.index ["slug"], name: "index_telegram_message_report_observers_on_slug", unique: true
    t.index ["telegram_username_observer_id"], name: "index_t_username_observer_on_t_message_report_observer"
  end

  create_table "telegram_message_report_reporters", force: :cascade do |t|
    t.bigint "telegram_username_reporter_id"
    t.string "chat_id"
    t.string "username_telegram"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_telegram_message_report_reporters_on_deleted_at"
    t.index ["slug"], name: "index_telegram_message_report_reporters_on_slug", unique: true
    t.index ["telegram_username_reporter_id"], name: "index_t_username_reporter_on_t_message_report_reporter"
  end

  create_table "telegram_message_traveler_observers", force: :cascade do |t|
    t.bigint "telegram_username_observer_id"
    t.string "chat_id"
    t.string "username_telegram"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_telegram_message_traveler_observers_on_deleted_at"
    t.index ["slug"], name: "index_telegram_message_traveler_observers_on_slug", unique: true
    t.index ["telegram_username_observer_id"], name: "index_t_username_reporter_on_t_message_traveler_observer"
  end

  create_table "telegram_message_traveler_reporters", force: :cascade do |t|
    t.bigint "telegram_username_reporter_id"
    t.string "chat_id"
    t.string "username_telegram"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_telegram_message_traveler_reporters_on_deleted_at"
    t.index ["slug"], name: "index_telegram_message_traveler_reporters_on_slug", unique: true
    t.index ["telegram_username_reporter_id"], name: "index_t_username_reporter_on_t_message_traveler_reporter"
  end

  create_table "telegram_username_observers", force: :cascade do |t|
    t.bigint "main_dinkes_province_id"
    t.bigint "main_dinkes_region_id"
    t.bigint "main_hospital_id"
    t.bigint "main_public_health_center_id"
    t.bigint "user_id"
    t.string "username_telegram"
    t.datetime "last_activity_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.string "name"
    t.index ["deleted_at"], name: "index_telegram_username_observers_on_deleted_at"
    t.index ["main_dinkes_province_id"], name: "index_telegram_username_observers_on_main_dinkes_province_id"
    t.index ["main_dinkes_region_id"], name: "index_telegram_username_observers_on_main_dinkes_region_id"
    t.index ["main_hospital_id"], name: "index_telegram_username_observers_on_main_hospital_id"
    t.index ["main_public_health_center_id"], name: "index_m_public_health_center_on_t_username_reporter"
    t.index ["slug"], name: "index_telegram_username_observers_on_slug", unique: true
    t.index ["user_id"], name: "index_telegram_username_observers_on_user_id"
    t.index ["username_telegram"], name: "index_telegram_username_observers_on_username_telegram", unique: true
  end

  create_table "telegram_username_reporters", force: :cascade do |t|
    t.bigint "main_city_id"
    t.bigint "main_district_id"
    t.bigint "main_sub_district_id"
    t.bigint "main_citizen_association_id"
    t.bigint "main_neighborhood_association_id"
    t.string "username_telegram"
    t.datetime "last_activity_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.index ["deleted_at"], name: "index_telegram_username_reporters_on_deleted_at"
    t.index ["main_citizen_association_id"], name: "index_m_citizen_association_on_t_username_reporter"
    t.index ["main_city_id"], name: "index_telegram_username_reporters_on_main_city_id"
    t.index ["main_district_id"], name: "index_telegram_username_reporters_on_main_district_id"
    t.index ["main_neighborhood_association_id"], name: "index_m_neighborhood_association_on_t_username_reporter"
    t.index ["main_sub_district_id"], name: "index_telegram_username_reporters_on_main_sub_district_id"
    t.index ["slug"], name: "index_telegram_username_reporters_on_slug", unique: true
    t.index ["username_telegram"], name: "index_telegram_username_reporters_on_username_telegram", unique: true
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
    t.datetime "last_activity_at"
    t.string "name"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "phone_number"
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

  add_foreign_key "l_six_fifths", "l_six_firsts"
  add_foreign_key "l_six_firsts", "main_patients"
  add_foreign_key "l_six_firsts", "users"
  add_foreign_key "l_six_fourths", "l_six_firsts"
  add_foreign_key "l_six_seconds", "l_six_firsts"
  add_foreign_key "l_six_seconds", "main_hospitals"
  add_foreign_key "l_six_t_checkothers", "l_six_thirds"
  add_foreign_key "l_six_thirds", "l_six_firsts"
  add_foreign_key "lampiran_eleven_close_contact_info_homes", "lampiran_eleven_information_exposes"
  add_foreign_key "lampiran_eleven_close_contact_informations", "main_patients"
  add_foreign_key "lampiran_eleven_close_contact_informations", "main_public_health_centers"
  add_foreign_key "lampiran_eleven_close_contact_informations", "users"
  add_foreign_key "lampiran_eleven_close_contacts", "lampiran_eleven_information_exposes"
  add_foreign_key "lampiran_eleven_close_contacts", "main_cities", column: "end_travel_qn_2_id"
  add_foreign_key "lampiran_eleven_close_contacts", "main_cities", column: "start_travel_qn_2_id"
  add_foreign_key "lampiran_eleven_close_contacts", "main_job_types"
  add_foreign_key "lampiran_eleven_close_contacts", "main_transportations"
  add_foreign_key "lampiran_eleven_comorbid_conditions", "lampiran_eleven_close_contact_informations"
  add_foreign_key "lampiran_eleven_contact_statuses", "lampiran_eleven_close_contact_informations"
  add_foreign_key "lampiran_eleven_contact_symptoms", "lampiran_eleven_info_exposes_officers"
  add_foreign_key "lampiran_eleven_info_exposes_officers", "lampiran_eleven_close_contact_informations"
  add_foreign_key "lampiran_eleven_info_exposes_officers", "main_dinkes_provinces"
  add_foreign_key "lampiran_eleven_info_exposes_officers", "main_dinkes_regions"
  add_foreign_key "lampiran_eleven_info_exposes_officers", "main_hospitals"
  add_foreign_key "lampiran_eleven_info_exposes_officers", "main_job_positions"
  add_foreign_key "lampiran_eleven_info_exposes_officers", "main_public_health_centers"
  add_foreign_key "lampiran_eleven_information_exposes", "lampiran_eleven_close_contact_informations"
  add_foreign_key "lampiran_eleven_information_exposes", "main_set_locations"
  add_foreign_key "lampiran_eleven_information_exposes", "main_type_contacts"
  add_foreign_key "lampiran_eleven_other_symptoms", "lampiran_eleven_info_exposes_officers"
  add_foreign_key "lampiran_eleven_respiratory_symptoms", "lampiran_eleven_info_exposes_officers"
  add_foreign_key "lampiran_eleven_specimen_contacts", "lampiran_eleven_close_contact_informations"
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
  add_foreign_key "main_public_health_centers", "main_dinkes_regions"
  add_foreign_key "main_public_health_centers", "main_sub_districts"
  add_foreign_key "main_sub_districts", "main_districts"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "telegram_chat_observers", "telegram_username_observers"
  add_foreign_key "telegram_chat_reporters", "telegram_username_reporters"
  add_foreign_key "telegram_message_checkin_reporters", "telegram_username_reporters"
  add_foreign_key "telegram_message_closecont_observers", "telegram_username_observers"
  add_foreign_key "telegram_message_closecont_reporters", "telegram_username_reporters"
  add_foreign_key "telegram_message_ili_observers", "telegram_username_observers"
  add_foreign_key "telegram_message_ili_reporters", "telegram_username_reporters"
  add_foreign_key "telegram_message_report_observers", "telegram_username_observers"
  add_foreign_key "telegram_message_report_reporters", "telegram_username_reporters"
  add_foreign_key "telegram_message_traveler_observers", "telegram_username_observers"
  add_foreign_key "telegram_message_traveler_reporters", "telegram_username_reporters"
  add_foreign_key "telegram_username_observers", "main_dinkes_provinces"
  add_foreign_key "telegram_username_observers", "main_dinkes_regions"
  add_foreign_key "telegram_username_observers", "main_hospitals"
  add_foreign_key "telegram_username_observers", "main_public_health_centers"
  add_foreign_key "telegram_username_observers", "users"
  add_foreign_key "telegram_username_reporters", "main_cities"
  add_foreign_key "telegram_username_reporters", "main_citizen_associations"
  add_foreign_key "telegram_username_reporters", "main_districts"
  add_foreign_key "telegram_username_reporters", "main_neighborhood_associations"
  add_foreign_key "telegram_username_reporters", "main_sub_districts"
  add_foreign_key "users", "main_dinkes_provinces"
  add_foreign_key "users", "main_dinkes_regions"
  add_foreign_key "users", "main_hospitals"
  add_foreign_key "users", "main_public_health_centers"
  add_foreign_key "users", "roles"
end
