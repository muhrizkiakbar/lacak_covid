class CreateLSixThirds < ActiveRecord::Migration[5.2]
  def change
    create_table :l_six_thirds do |t|
      t.references :l_six_third, foreign_key: true
      t.date :date_nasopharyngeal
      t.string :place_nasopharyngeal
      t.text :result_nasopharyngeal
      t.date :date_oropharyngeal
      t.string :place_oropharyngeal
      t.text :result_oropharyngeal
      t.date :date_sputum
      t.string :place_sputum
      t.text :result_sputum
      t.date :date_serum
      t.string :place_serum
      t.text :result_serum

      t.timestamps
    end
  end
end
