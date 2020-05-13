# == Schema Information
#
# Table name: main_job_types
#
#  id         :bigint           not null, primary key
#  job_type   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  slug       :string
#
require 'test_helper'

class Main::JobTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
