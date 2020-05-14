# == Schema Information
#
# Table name: lampiran_eleven_information_exposes
#
#  id                                           :bigint           not null, primary key
#  lampiran_eleven_close_contact_information_id :bigint
#  main_type_contact_id                         :bigint
#  main_set_location_id                         :bigint
#  other_type_contact                           :string
#  date_contact                                 :date
#  duration_contact                             :time
#  other_set_location                           :string
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  slug                                         :string
#  deleted_at                                   :datetime
#
require 'test_helper'

class LampiranEleven::InformationExposeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
