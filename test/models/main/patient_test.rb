# == Schema Information
#
# Table name: main_patients
#
#  id                               :bigint           not null, primary key
#  main_city_id                     :bigint
#  main_district_id                 :bigint
#  main_sub_district_id             :bigint
#  main_citizen_association_id      :bigint
#  main_neighborhood_association_id :bigint
#  main_marital_status_id           :bigint
#  name_of_parent                   :string
#  address                          :text
#  phone_number                     :string
#  date_of_birth                    :date
#  gender                           :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  slug                             :string
#  deleted_at                       :datetime
#  encrypted_no_identity            :string
#  encrypted_no_identity_iv         :string
#  encrypted_name                   :string
#  encrypted_name_iv                :string
#
require 'test_helper'

class Main::PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
