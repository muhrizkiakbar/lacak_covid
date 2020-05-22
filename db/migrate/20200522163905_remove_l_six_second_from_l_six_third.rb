class RemoveLSixSecondFromLSixThird < ActiveRecord::Migration[5.2]
  def change
    remove_reference :l_six_thirds, :l_six_second, foreign_key: true
  end
end
