class AddDeletedAtToLampiranElevenInfoExposesOfficer < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_info_exposes_officers, :deleted_at, :datetime
    add_index :lampiran_eleven_info_exposes_officers, :deleted_at
  end
end
