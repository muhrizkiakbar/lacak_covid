class CreateMainNeighborhoodAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :main_neighborhood_associations do |t|
      t.string :neighborhood_association
      t.references :main_citizen_association, foreign_key: true, index: {:name => "index_m_neighborhood_assoc_on_m_citizen_assoc"}

      t.timestamps
    end
  end
end
