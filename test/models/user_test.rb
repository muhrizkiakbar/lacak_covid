# == Schema Information
#
# Table name: users
#
#  id                           :bigint           not null, primary key
#  username                     :string           default(""), not null
#  email                        :string           default(""), not null
#  encrypted_password           :string           default(""), not null
#  main_dinkes_province_id      :bigint
#  main_dinkes_region_id        :bigint
#  main_hospital_id             :bigint
#  main_public_health_center_id :bigint
#  reset_password_token         :string
#  reset_password_sent_at       :datetime
#  remember_created_at          :datetime
#  sign_in_count                :integer          default(0), not null
#  current_sign_in_at           :datetime
#  last_sign_in_at              :datetime
#  current_sign_in_ip           :inet
#  last_sign_in_ip              :inet
#  failed_attempts              :integer          default(0), not null
#  unlock_token                 :string
#  locked_at                    :datetime
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  slug                         :string
#  deleted_at                   :datetime
#  role_id                      :bigint
#  last_activity_at             :datetime
#  name                         :string
#  avatar_file_name             :string
#  avatar_content_type          :string
#  avatar_file_size             :integer
#  avatar_updated_at            :datetime
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
