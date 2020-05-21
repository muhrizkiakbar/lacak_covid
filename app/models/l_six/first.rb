class LSix::First < ApplicationRecord
  belongs_to :main_patient
  belongs_to :user
end
