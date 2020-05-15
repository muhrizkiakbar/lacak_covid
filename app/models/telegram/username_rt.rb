# == Schema Information
#
# Table name: telegram_username_rts
#
#  id                               :bigint           not null, primary key
#  main_city_id                     :bigint
#  main_district_id                 :bigint
#  main_sub_district_id             :bigint
#  main_citizen_association_id      :bigint
#  main_neighborhood_association_id :bigint
#  username_telegram                :string
#  last_activity                    :datetime
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  slug                             :string
#  deleted_at                       :datetime
#
class Telegram::UsernameRt < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
    
  has_many :message_report_rt, class_name: 'Telegram::MessageReportRt', foreign_key: :telegram_username_rt_id

  belongs_to :city, class_name: 'Main::City', foreign_key: :main_city_id
  belongs_to :district, class_name: 'Main::District', foreign_key: :main_district_id
  belongs_to :sub_district, class_name: 'Main::SubDistrict', foreign_key: :main_sub_district_id
  belongs_to :citizen_association, class_name: 'Main::CitizenAssociation', foreign_key: :main_citizen_association_id
  belongs_to :neighborhood_association, class_name: 'Main::NeighborhoodAssociation', foreign_key: :main_neighborhood_association_id
end
