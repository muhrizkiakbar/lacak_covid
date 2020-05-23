class RemoveDateOfBirthFromLSixFifth < ActiveRecord::Migration[5.2]
  def change
    remove_column :l_six_fifths, :date_of_birth, :date
  end
end
