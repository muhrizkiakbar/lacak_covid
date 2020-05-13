class AddDeletedAtToLampiranElevenCloseContact < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_close_contacts, :deleted_at, :datetime
    add_index :lampiran_eleven_close_contacts, :deleted_at
  end
end
