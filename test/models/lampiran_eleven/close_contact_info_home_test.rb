# == Schema Information
#
# Table name: lampiran_eleven_close_contact_info_homes
#
#  id                                    :bigint           not null, primary key
#  lampiran_eleven_information_expose_id :bigint
#  address_close_contact_primer          :text
#  last_date_close_contact_primer        :date
#  is_room_contact_or_activity           :boolean
#  number_of_days_of_contact_activity    :integer
#  is_treating_primary_case              :boolean
#  is_hugging_the_primary_case           :boolean
#  is_primary_case_shake                 :boolean
#  is_drink_using_the_same_place         :boolean
#  is_use_the_same_toilet                :boolean
#  is_kiss_the_primary_case              :boolean
#  is_sleep_in_the_same_room             :boolean
#  is_eat_using_the_same_place           :boolean
#  is_using_the_same_equipment           :boolean
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  slug                                  :string
#  deleted_at                            :datetime
#
require 'test_helper'

class LampiranEleven::CloseContactInfoHomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
