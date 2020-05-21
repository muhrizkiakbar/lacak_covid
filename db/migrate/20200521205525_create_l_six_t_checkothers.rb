class CreateLSixTCheckothers < ActiveRecord::Migration[5.2]
  def change
    create_table :l_six_t_checkothers do |t|
      t.references :l_six_third, foreign_key: true
      t.string :other_check
      t.date :date_check_other
      t.string :place_check_other
      t.text :result_check_other

      t.timestamps
    end
  end
end
