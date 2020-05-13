class AddSlugToLampiranElevenInformationExpose < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_information_exposes, :slug, :string
    add_index :lampiran_eleven_information_exposes, :slug, unique: true
  end
end
