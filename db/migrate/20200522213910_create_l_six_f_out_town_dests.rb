class CreateLSixFOutTownDests < ActiveRecord::Migration[5.2]
  def change
    create_table :l_six_f_out_town_dests do |t|
      t.references :l_six_fourth, foreign_key: true
      t.string :province
      t.string :city
      t.date :travel_date
      t.date :date_arrive

      t.timestamps
    end
  end
end
