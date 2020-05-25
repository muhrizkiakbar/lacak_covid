class RemoveColumnFromMainPatient < ActiveRecord::Migration[5.2]
  def change
    remove_column :main_patients, :no_identity
    remove_column :main_patients, :name
  end
end
