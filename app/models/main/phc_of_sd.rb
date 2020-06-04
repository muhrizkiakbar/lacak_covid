# == Schema Information
#
# Table name: main_phc_of_sds
#
#  id                           :bigint           not null, primary key
#  main_public_health_center_id :bigint
#  main_sub_district_id         :bigint
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
class Main::PhcOfSd < ApplicationRecord
  # belongs_to :main_public_health_center
  # belongs_to :main_sub_district

  belongs_to :public_health_center, class_name: 'Main::PublicHealthCenter', foreign_key: :main_public_health_center_id
  belongs_to :sub_district, class_name: 'Main::SubDistrict', foreign_key: :main_sub_district_id
end
