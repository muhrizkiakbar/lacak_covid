class AddJobToLSixFirst < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_firsts, :job, :string
  end
end
