# == Schema Information
#
# Table name: main_public_health_centers
#
#  id                   :bigint           not null, primary key
#  public_health_center :string
#  main_hospital_id     :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  slug                 :string
#  deleted_at           :datetime
#
require 'test_helper'

class Main::PublicHealthCenterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
