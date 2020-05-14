class AddSlugToLampiranElevenOtherSymptom < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_other_symptoms, :slug, :string
    add_index :lampiran_eleven_other_symptoms, :slug, unique: true
  end
end
