class CreateLampiranElevenComorbidConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :lampiran_eleven_comorbid_conditions do |t|
      t.references :lampiran_eleven_close_contact_information, foreign_key: true, index: {:name => "index_l_e_close_contact_info_on_l_e_comorbid_condition"}
      t.boolean :is_cancer
      t.boolean :is_diabetes
      t.boolean :is_ppok
      t.boolean :is_hiv
      t.boolean :is_liver
      t.boolean :is_obesity
      t.boolean :is_asthma
      t.boolean :is_blood_disorder
      t.boolean :is_heart_disease
      t.boolean :is_kidney
      t.boolean :is_neurology
      t.boolean :is_organ_donor_recipient
      t.boolean :is_pregnant
      t.boolean :is_first_semester_pregnant
      t.boolean :is_second_semester_pregnant
      t.boolean :is_third_semester_pregnant
      t.date :estimated_birth
      t.boolean :is_influenza_vaccine
      t.date :date_of_influenza_vaccine
      t.string :influenza_vaccine_in_the_country
      t.boolean :is_pvc_vaccine
      t.date :date_of_pvc_vaccine

      t.timestamps
    end
  end
end
