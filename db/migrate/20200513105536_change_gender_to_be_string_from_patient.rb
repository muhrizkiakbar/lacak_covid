class ChangeGenderToBeStringFromPatient < ActiveRecord::Migration[5.2]
  def change
    change_column :main_patients, :gender, :string
  end
end
