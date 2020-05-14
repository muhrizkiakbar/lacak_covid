# == Schema Information
#
# Table name: lampiran_eleven_close_contact_informations
#
#  id                           :bigint           not null, primary key
#  user_id                      :bigint
#  main_patient_id              :bigint
#  main_public_health_center_id :bigint
#  fill_in_date                 :date
#  contact_tracking_date        :date
#  contact_with_positive_case   :string
#  placement                    :text
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  slug                         :string
#  deleted_at                   :datetime
#
require 'test_helper'

class LampiranEleven::CloseContactInformationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
