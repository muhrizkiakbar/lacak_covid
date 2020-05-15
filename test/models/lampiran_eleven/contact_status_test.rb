# == Schema Information
#
# Table name: lampiran_eleven_contact_statuses
#
#  id                                           :bigint           not null, primary key
#  lampiran_eleven_close_contact_information_id :bigint
#  status_patient                               :string
#  date_of_status_recovered                     :date
#  date_of_status_died                          :date
#  is_been_treated                              :boolean
#  start_date_of_treated                        :date
#  end_date_of_treated                          :date
#  is_dead_with_autopsy                         :boolean
#  result_of_autopsy                            :text
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  slug                                         :string
#  deleted_at                                   :datetime
#
require 'test_helper'

class LampiranEleven::ContactStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
