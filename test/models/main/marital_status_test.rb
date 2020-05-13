# == Schema Information
#
# Table name: main_marital_statuses
#
#  id             :bigint           not null, primary key
#  marital_status :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  slug           :string
#  deleted_at     :datetime
#
require 'test_helper'

class Main::MaritalStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
