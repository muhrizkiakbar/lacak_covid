# == Schema Information
#
# Table name: l_six_seconds
#
#  id                        :bigint           not null, primary key
#  l_six_first_id            :bigint
#  main_hospital_id          :bigint
#  since_date_symptom        :date
#  fever_temperature         :decimal(, )
#  history_fever             :boolean
#  cough                     :decimal(, )
#  cold                      :decimal(, )
#  sore_throat               :decimal(, )
#  headache                  :decimal(, )
#  weak                      :decimal(, )
#  muscle_ache               :decimal(, )
#  nausea_vomitting          :decimal(, )
#  abdominal_pain            :decimal(, )
#  diarrhea                  :decimal(, )
#  other_symptom             :string
#  is_pregnant               :boolean
#  is_diabetes               :boolean
#  is_heart_disease          :boolean
#  is_hypertention           :boolean
#  is_malignancy             :boolean
#  is_kidney_disease         :boolean
#  is_liver_disease          :boolean
#  is_immune_disease         :boolean
#  is_ppok                   :boolean
#  other_condition           :string
#  is_being_treated_hospital :boolean
#  last_date_hospital        :date
#  room_treated              :string
#  is_treated_icu            :boolean
#  is_intubation             :boolean
#  is_emco                   :boolean
#  last_hospital             :text
#  last_status_patient       :string
#  date_of_die               :date
#  pneumonia                 :decimal(, )
#  ardc                      :decimal(, )
#  other_diagnose            :text
#  have_etiologi             :decimal(, )
#  explain_etiologi          :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  deleted_at                :datetime
#  slug                      :string
#
require 'test_helper'

class LSix::SecondTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
