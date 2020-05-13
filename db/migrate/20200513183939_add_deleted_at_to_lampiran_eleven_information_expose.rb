class AddDeletedAtToLampiranElevenInformationExpose < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_information_exposes, :deleted_at, :datetime
    add_index :lampiran_eleven_information_exposes, :deleted_at
  end
end
