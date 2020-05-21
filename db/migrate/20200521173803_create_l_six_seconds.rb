class CreateLSixSeconds < ActiveRecord::Migration[5.2]
  def change
    create_table :l_six_seconds do |t|
      t.references :l_six_first, foreign_key: true
      t.references :main_hospital, foreign_key: true
      t.date :since_date_symptom
      t.decimal :fever_temperature
      t.boolean :history_fever
      t.numeric :cough
      t.numeric :cold
      t.numeric :sore_throat
      t.numeric :headache
      t.numeric :weak
      t.numeric :muscle_ache
      t.numeric :nausea_vomitting
      t.numeric :abdominal_pain
      t.numeric :diarrhea
      t.string :other_symptom
      t.boolean :is_pregnant
      t.boolean :is_diabetes
      t.boolean :is_heart_disease
      t.boolean :is_hypertention
      t.boolean :is_malignancy
      t.boolean :is_kidney_disease
      t.boolean :is_liver_disease
      t.boolean :is_immune_disease
      t.boolean :is_ppok
      t.string :other_condition
      t.boolean :is_being_treated_hospital
      t.date :last_date_hospital
      t.string :room_treated
      t.boolean :is_treated_icu
      t.boolean :is_intubation
      t.boolean :is_emco
      t.text :last_hospital
      t.string :last_status_patient
      t.date :date_of_die
      t.numeric :pneumonia
      t.numeric :ardc
      t.text :other_diagnose
      t.numeric :have_etiologi
      t.text :explain_etiologi

      t.timestamps
    end
  end
end
