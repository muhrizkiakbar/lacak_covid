class AddSlugToLampiranElevenCloseContactInfoHome < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_close_contact_info_homes, :slug, :string
    add_index :lampiran_eleven_close_contact_info_homes, :slug, unique: true
  end
end
