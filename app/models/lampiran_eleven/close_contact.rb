class LampiranEleven::CloseContact < ApplicationRecord
  belongs_to :lampiran_eleven_information_expose
  belongs_to :start_travel_qn_1
  belongs_to :end_travel_qn_1
  belongs_to :start_travel_qn_2
  belongs_to :end_travel_qn_2
  belongs_to :main_job_type
  belongs_to :main_transportation
end
