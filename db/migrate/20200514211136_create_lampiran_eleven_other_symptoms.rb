class CreateLampiranElevenOtherSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :lampiran_eleven_other_symptoms do |t|
      t.references :lampiran_eleven_info_exposes_officer, foreign_key: true, index: {:name => "index_l_e_info_exposes_officer_on_l_e_other_symptom"}
      t.boolean :is_shivering
      t.boolean :is_nausea
      t.boolean :is_convulsions
      t.boolean :is_fatigue
      t.boolean :is_headache
      t.boolean :is_joint_pain
      t.boolean :is_muscleache
      t.boolean :is_throw_up
      t.boolean :is_diarrhea
      t.boolean :is_rash
      t.boolean :is_conjuctivitis
      t.boolean :is_bloody_nose
      t.boolean :is_loss_of_consciousness
      t.boolean :is_loss_of_appetite
      t.boolean :is_neurologis
      t.text :tell_of_neurologis
      t.text :other_symptom

      t.timestamps
    end
  end
end
