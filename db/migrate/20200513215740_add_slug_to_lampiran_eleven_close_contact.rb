class AddSlugToLampiranElevenCloseContact < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_close_contacts, :slug, :string
    add_index :lampiran_eleven_close_contacts, :slug, unique: true
  end
end
