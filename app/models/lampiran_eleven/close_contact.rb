class LampiranEleven::CloseContact < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  # has_one :close_contact_info_home, class_name: 'LampiranEleven::CloseContactInfoHome', foreign_key: :lampiran_eleven_close_contact_id

  belongs_to :information_expose, class_name: 'LampiranEleven::InformationExpose', foreign_key: :lampiran_eleven_information_expose_id
  belongs_to :start_travel_qn_2, class_name: 'Main::City', foreign_key: :start_travel_qn_2_id
  belongs_to :end_travel_qn_2, class_name: 'Main::City', foreign_key: :end_travel_qn_2_id
  belongs_to :job_type, class_name: 'Main::JobType', foreign_key: :main_job_type_id
  belongs_to :transportation, class_name: 'Main::Transportation', foreign_key: :main_transportation_id
end
