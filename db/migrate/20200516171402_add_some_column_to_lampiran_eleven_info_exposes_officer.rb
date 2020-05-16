class AddSomeColumnToLampiranElevenInfoExposesOfficer < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_info_exposes_officers, :is_gown_self, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_medic_mask_self, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_gloves_self, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_n95_ffp2_self, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_n99_ffp3_self, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_goggle_self, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :isn_apd_self, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_gown_aerosol, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_medic_mask_aerosol, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_gloves_aerosol, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_n95_ffp2_aerosol, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_n99_ffp3_aerosol, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :is_goggle_aerosol, :boolean
    add_column :lampiran_eleven_info_exposes_officers, :isn_apd_aerosol, :boolean
  end
end
