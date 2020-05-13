class LampiranEleven::CloseContact < ApplicationRecord

  belongs_to :information_expose, class_name: 'LampiranEleven::InformationExpose', foreign_key: :lampiran_eleven_information_expose_id
  belongs_to :start_travel_qn_2, class_name: 'Main::City', foreign_key: :main_city_id
  belongs_to :end_travel_qn_2, class_name: 'Main::City', foreign_key: :main_city_id
  belongs_to :job_type, class_name: 'Main::JobType', foreign_key: :main_job_type_id
  belongs_to :transportation, class_name: 'Main::Transportation', foreign_key: :main_transportation_id
end
