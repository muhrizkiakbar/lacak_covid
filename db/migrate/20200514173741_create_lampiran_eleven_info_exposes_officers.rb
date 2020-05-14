class CreateLampiranElevenInfoExposesOfficers < ActiveRecord::Migration[5.2]
  def change
    create_table :lampiran_eleven_info_exposes_officers do |t|
      t.references :lampiran_eleven_close_contact_information, foreign_key: true, index: {:name => "index_l_e_close_contact_info_on_l_e_info_exposes_officer"}
      t.references :main_dinkes_province, foreign_key: true, index: {:name => "index_m_dinkes_province_on_l_e_info_exposes_officer"}
      t.references :main_dinkes_region, foreign_key: true, index: {:name => "index_m_dinkes_region_on_l_e_info_exposes_officer"}
      t.references :main_hospital, foreign_key: true, index: {:name => "index_m_hospital_on_l_e_info_exposes_officer"}
      t.references :main_public_health_center, foreign_key: true, index: {:name => "index_m_public_health_center_on_l_e_info_exposes_officer"}
      t.boolean :is_contact_physic_with_positive
      t.boolean :is_procedure_aerosol
      t.text :explain_of_procedure_aerosol

      t.timestamps
    end
  end
end
