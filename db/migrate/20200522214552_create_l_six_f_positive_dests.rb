class CreateLSixFPositiveDests < ActiveRecord::Migration[5.2]
  def change
    create_table :l_six_f_positive_dests do |t|
      t.references :l_six_fourth, foreign_key: true
      t.string :name
      t.text :address
      t.string :relation
      t.date :date_contact
      t.date :last_date_contact

      t.timestamps
    end
  end
end
