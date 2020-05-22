class AddLSixFirstToLSixThird < ActiveRecord::Migration[5.2]
  def change
    add_reference :l_six_thirds, :l_six_first, foreign_key: true
  end
end
