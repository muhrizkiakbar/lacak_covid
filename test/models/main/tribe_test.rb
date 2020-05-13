# == Schema Information
#
# Table name: main_tribes
#
#  id         :bigint           not null, primary key
#  tribe      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  slug       :string
#
require 'test_helper'

class Main::TribeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
