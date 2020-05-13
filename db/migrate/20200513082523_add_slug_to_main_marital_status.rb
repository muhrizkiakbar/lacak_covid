class AddSlugToMainMaritalStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :main_marital_statuses, :slug, :string
    add_index :main_marital_statuses, :slug, unique: true
  end
end
