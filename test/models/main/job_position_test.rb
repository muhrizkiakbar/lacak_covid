# == Schema Information
#
# Table name: main_job_positions
#
#  id           :bigint           not null, primary key
#  job_position :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#  deleted_at   :datetime
#
require 'test_helper'

class Main::JobPositionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
