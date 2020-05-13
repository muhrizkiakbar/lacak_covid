class CreateMainTransportations < ActiveRecord::Migration[5.2]
  def change
    create_table :main_transportations do |t|
      t.string :transportation

      t.timestamps
    end
  end
end
