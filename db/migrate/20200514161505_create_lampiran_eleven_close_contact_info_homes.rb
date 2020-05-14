class CreateLampiranElevenCloseContactInfoHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :lampiran_eleven_close_contact_info_homes do |t|
      t.references :lampiran_eleven_information_expose, foreign_key: true, index: {:name => "index_l_e_info_expose_on_l_e_close_contact_info_home"}
      t.text :address_close_contact_primer
      t.date :last_date_close_contact_primer
      t.boolean :is_room_contact_or_activity
      t.integer :number_of_days_of_contact_activity
      t.boolean :is_treating_primary_case
      t.boolean :is_hugging_the_primary_case
      t.boolean :is_hugging_the_primary_case
      t.boolean :is_primary_case_shake
      t.boolean :is_drink_using_the_same_place
      t.boolean :is_use_the_same_toilet
      t.boolean :is_kiss_the_primary_case
      t.boolean :is_sleep_in_the_same_room
      t.boolean :is_eat_using_the_same_place
      t.boolean :is_using_the_same_equipment

      t.timestamps
    end
  end
end
