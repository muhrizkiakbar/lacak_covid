# == Schema Information
#
# Table name: roles
#
#  id                      :bigint           not null, primary key
#  name                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  slug                    :string
#  deleted_at              :datetime
#  is_show_to_all          :boolean
#  is_surveilance          :boolean
#  is_public_health_center :boolean
#  is_dinkes_region        :boolean
#  is_dinkes_province      :boolean
#
require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
