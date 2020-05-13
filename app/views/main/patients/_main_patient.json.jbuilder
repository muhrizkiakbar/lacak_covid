json.extract! main_patient, :id, :main_tribe_id, :main_city_id, :main_district_id, :main_sub_district_id, :main_citizen_association_id, :main_neighborhood_association_id, :main_marital_status_id, :no_identity, :name_of_parent, :name, :address, :phone_number, :date_of_birth, :gender, :created_at, :updated_at
json.url main_patient_url(main_patient, format: :json)
