class AddResidenceAddressToMainPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :main_patients, :residence_address, :text
  end
end
