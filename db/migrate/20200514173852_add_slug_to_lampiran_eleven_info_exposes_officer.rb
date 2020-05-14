class AddSlugToLampiranElevenInfoExposesOfficer < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_info_exposes_officers, :slug, :string
    add_index :lampiran_eleven_info_exposes_officers, :slug, unique: true
  end
end
