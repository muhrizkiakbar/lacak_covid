class RemoveColumnFromLSixFourth < ActiveRecord::Migration[5.2]
  def change
    remove_column :l_six_fourths, :abroad_destination, :hstore
    remove_column :l_six_fourths, :out_town_destination, :hstore
    remove_column :l_six_fourths, :hospital_destination, :hstore
    remove_column :l_six_fourths, :animal_market_destination, :hstore
    remove_column :l_six_fourths, :contact_pdp_destination, :hstore
    remove_column :l_six_fourths, :contact_positive_destination, :hstore
  end
end
