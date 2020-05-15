# == Schema Information
#
# Table name: lampiran_eleven_specimen_contacts
#
#  id                                           :bigint           not null, primary key
#  lampiran_eleven_close_contact_information_id :bigint
#  type_of_specimen                             :boolean
#  date_of_specimen_collection                  :date
#  laboratory_examination_results               :text
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  slug                                         :string
#  deleted_at                                   :datetime
#
require 'test_helper'

class LampiranEleven::SpecimenContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
