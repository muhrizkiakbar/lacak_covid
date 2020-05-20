class AddIndexToPatient < ActiveRecord::Migration[5.2]
  def change
    add_index :main_patients, :no_identity
    add_index :main_patients, :gender
  end
end
