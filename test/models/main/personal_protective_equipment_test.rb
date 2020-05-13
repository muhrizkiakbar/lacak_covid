# == Schema Information
#
# Table name: main_personal_protective_equipments
#
#  id                            :bigint           not null, primary key
#  personal_protective_equipment :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  slug                          :string
#  deleted_at                    :datetime
#
require 'test_helper'

class Main::PersonalProtectiveEquipmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
