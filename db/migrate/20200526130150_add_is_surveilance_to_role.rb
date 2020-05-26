class AddIsSurveilanceToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :is_surveilance, :boolean
  end
end
