class AddCityToMainDinkesRegion < ActiveRecord::Migration[5.2]
  def change
    add_reference :main_dinkes_regions, :main_city, foreign_key: true
  end
end
