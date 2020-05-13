class AddSlugToLampiranElevenCloseContactInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_close_contact_informations, :slug, :string
    add_index :lampiran_eleven_close_contact_informations, :slug, unique: true
  end
end
