class AddOutOfBreathToLSixSecond < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_seconds, :out_of_breath, :numeric
  end
end
