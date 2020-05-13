# == Schema Information
#
# Table name: main_neighborhood_associations
#
#  id                          :bigint           not null, primary key
#  neighborhood_association    :string
#  main_citizen_association_id :bigint
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  slug                        :string
#  deleted_at                  :datetime
#
require 'test_helper'

class Main::NeighborhoodAssociationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
