# == Schema Information
#
# Table name: main_type_contacts
#
#  id           :bigint           not null, primary key
#  type_contact :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#  slug         :string
#
require 'test_helper'

class Main::TypeContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
