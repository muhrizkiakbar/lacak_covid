class AddSlugToLampiranElevenRespiratorySymptom < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_respiratory_symptoms, :slug, :string
    add_index :lampiran_eleven_respiratory_symptoms, :slug, unique: true
  end
end
