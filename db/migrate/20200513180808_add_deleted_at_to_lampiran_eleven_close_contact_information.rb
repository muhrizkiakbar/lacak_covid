class AddDeletedAtToLampiranElevenCloseContactInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_close_contact_informations, :deleted_at, :datetime
    add_index :lampiran_eleven_close_contact_informations, :deleted_at
  end
end
