class CreateLSixFourths < ActiveRecord::Migration[5.2]
  def change
    create_table :l_six_fourths do |t|
      t.references :l_six_first, foreign_key: true
      t.numeric :abroad
      t.numeric :out_town
      t.numeric :hospital
      t.numeric :animal_market
      t.numeric :contact_pdp
      t.numeric :contact_positive
      t.numeric :ispa_chronic
      t.numeric :medic_officer
      t.text :explain_of_procedure_alcohol
      t.boolean :is_goggle
      t.boolean :isn_apd
      t.boolean :is_n99_ffp3
      t.boolean :is_n95_ffp2
      t.boolean :is_gloves
      t.boolean :is_medic_mask
      t.boolean :is_gown
      t.boolean :is_procedure

      t.timestamps
    end
  end
end
