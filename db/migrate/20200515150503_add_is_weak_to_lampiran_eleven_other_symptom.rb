class AddIsWeakToLampiranElevenOtherSymptom < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_other_symptoms, :is_weak, :boolean
  end
end
