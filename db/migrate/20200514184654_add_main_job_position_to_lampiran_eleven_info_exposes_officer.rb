class AddMainJobPositionToLampiranElevenInfoExposesOfficer < ActiveRecord::Migration[5.2]
  def change
    add_reference :lampiran_eleven_info_exposes_officers, :main_job_position, foreign_key: true, index: {:name => "index_m_job_position_on_l_e_info_exposes_officer"}

  end
end
