class CreateMainMaritalStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :main_marital_statuses do |t|
      t.string :marital_status

      t.timestamps
    end
  end
end
