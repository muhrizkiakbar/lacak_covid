class AddSlugToLampiranElevenContactStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_contact_statuses, :slug, :string
    add_index :lampiran_eleven_contact_statuses, :slug, unique: true
  end
end
