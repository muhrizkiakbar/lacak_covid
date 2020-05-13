class AddSlugToMainNeighborhoodAssociation < ActiveRecord::Migration[5.2]
  def change
    add_column :main_neighborhood_associations, :slug, :string
    add_index :main_neighborhood_associations, :slug, unique: true
  end
end
