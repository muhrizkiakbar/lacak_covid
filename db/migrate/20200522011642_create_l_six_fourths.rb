class CreateLSixFourths < ActiveRecord::Migration[5.2]
  enable_extension 'hstore' unless extension_enabled?('hstore')
  def change
    create_table :l_six_fourths do |t|
      t.references :l_six_first, foreign_key: true
      t.numeric :abroad
      t.hstore :abroad_destination
      t.numeric :out_town
      t.hstore :out_town_destination
      t.numeric :hospital
      t.hstore :hospital_destination
      t.numeric :animal_market
      t.hstore :animal_market_destination
      t.numeric :contact_pdp
      t.hstore :contact_pdp_destination
      t.numeric :contact_positive
      t.hstore :contact_positive_destination
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
