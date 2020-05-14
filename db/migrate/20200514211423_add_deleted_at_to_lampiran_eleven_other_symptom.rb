class AddDeletedAtToLampiranElevenOtherSymptom < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_other_symptoms, :deleted_at, :datetime
    add_index :lampiran_eleven_other_symptoms, :deleted_at
  end
end
