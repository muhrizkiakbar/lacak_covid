class AddDeletedAtToLampiranElevenSpecimenContact < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_specimen_contacts, :deleted_at, :datetime
    add_index :lampiran_eleven_specimen_contacts, :deleted_at
  end
end
