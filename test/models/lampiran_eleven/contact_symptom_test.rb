# == Schema Information
#
# Table name: lampiran_eleven_contact_symptoms
#
#  id                                      :bigint           not null, primary key
#  lampiran_eleven_info_exposes_officer_id :bigint
#  is_sore_throat                          :boolean
#  date_of_sore_throat                     :date
#  is_cough                                :boolean
#  date_of_cough                           :date
#  is_flu                                  :boolean
#  date_of_flu                             :date
#  is_out_of_breath                        :boolean
#  date_of_out_of_breath                   :date
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#  slug                                    :string
#  deleted_at                              :datetime
#
require 'test_helper'

class LampiranEleven::ContactSymptomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
