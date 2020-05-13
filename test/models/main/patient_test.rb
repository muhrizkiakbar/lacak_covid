# == Schema Information
#
# Table name: main_patients
#
#  id                               :bigint           not null, primary key
#  main_tribe_id                    :bigint
#  main_city_id                     :bigint
#  main_district_id                 :bigint
#  main_sub_district_id             :bigint
#  main_citizen_association_id      :bigint
#  main_neighborhood_association_id :bigint
#  main_marital_status_id           :bigint
#  no_identity                      :string
#  name_of_parent                   :string
#  name                             :string
#  address                          :text
#  phone_number                     :string
#  date_of_birth                    :date
#  gender                           :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  slug                             :string
#  deleted_at                       :datetime
#
require 'test_helper'

class Main::PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
