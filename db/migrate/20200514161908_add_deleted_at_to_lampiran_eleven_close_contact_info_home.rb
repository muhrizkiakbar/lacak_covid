class AddDeletedAtToLampiranElevenCloseContactInfoHome < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_close_contact_info_homes, :deleted_at, :datetime
    add_index :lampiran_eleven_close_contact_info_homes, :deleted_at
  end
end
