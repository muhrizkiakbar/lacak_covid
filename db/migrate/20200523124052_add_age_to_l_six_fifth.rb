class AddAgeToLSixFifth < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_fifths, :age, :integer
  end
end
