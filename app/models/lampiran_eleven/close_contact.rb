# == Schema Information
#
# Table name: lampiran_eleven_close_contacts
#
#  id                                    :bigint           not null, primary key
#  lampiran_eleven_information_expose_id :bigint
#  start_travel_qn_2_id                  :bigint
#  end_travel_qn_2_id                    :bigint
#  main_job_type_id                      :bigint
#  main_transportation_id                :bigint
#  question_number_1                     :boolean
#  date_question_number_1                :date
#  question_number_2                     :boolean
#  date_question_number_2                :date
#  question_number_3                     :boolean
#  date_question_number_3                :date
#  other_job_type                        :string
#  address_job                           :text
#  other_transportation                  :string
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  slug                                  :string
#  deleted_at                            :datetime
#  answer_qn_1                           :string
#
class LampiranEleven::CloseContact < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  # has_one :close_contact_info_home, class_name: 'LampiranEleven::CloseContactInfoHome', foreign_key: :lampiran_eleven_close_contact_id

  belongs_to :information_expose, class_name: 'LampiranEleven::InformationExpose', foreign_key: :lampiran_eleven_information_expose_id
  belongs_to :start_travel_qn_2, class_name: 'Main::City', foreign_key: :start_travel_qn_2_id, optional: true
  belongs_to :end_travel_qn_2, class_name: 'Main::City', foreign_key: :end_travel_qn_2_id, optional: true
  belongs_to :job_type, class_name: 'Main::JobType', foreign_key: :main_job_type_id, optional: true
  belongs_to :transportation, class_name: 'Main::Transportation', foreign_key: :main_transportation_id, optional: true

  def information_expose
    LampiranEleven::InformationExpose.unscoped {super}
  end

  def transportation
    Main::Transportation.unscoped {super}
  end

  def job_type
    Main::Transportation.unscoped {super}
  end

  def start_travel_qn_2
    Main::City.unscoped {super}
  end

  def end_travel_qn_2
    Main::City.unscoped {super}
  end
end
