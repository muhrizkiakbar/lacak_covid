# == Schema Information
#
# Table name: l_six_firsts
#
#  id              :bigint           not null, primary key
#  main_patient_id :bigint
#  user_id         :bigint
#  interview_date  :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deleted_at      :datetime
#  slug            :string
#  job             :string
#
require 'test_helper'

class LSix::FirstTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
