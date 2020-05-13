class AddSlugToMainTransportation < ActiveRecord::Migration[5.2]
  def change
    add_column :main_transportations, :slug, :string
    add_index :main_transportations, :slug, unique: true
  end
end
