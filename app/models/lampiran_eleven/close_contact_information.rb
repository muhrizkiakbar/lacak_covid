class LampiranEleven::CloseContactInformation < ApplicationRecord
  belongs_to :user
  belongs_to :main_patient
  belongs_to :main_public_health_center
end
