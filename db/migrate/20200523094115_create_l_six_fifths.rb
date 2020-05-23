class CreateLSixFifths < ActiveRecord::Migration[5.2]
  def change
    create_table :l_six_fifths do |t|
      t.references :l_six_first, foreign_key: true
      t.string :name
      t.date :date_of_birth
      t.string :gender
      t.string :relation
      t.text :address
      t.string :phone_number
      t.text :activity

      t.timestamps
    end
  end
end
