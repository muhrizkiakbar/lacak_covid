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
class LSix::Second < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  
  enum cough: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" => 0]
  enum cold: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" => 0]
  enum sore_throat: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" => 0]
  enum headache: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" => 0]
  enum weak: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" =>]
  enum muscle_ache: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" =>]
  enum nausea_vomitting: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" =>]
  enum abdominal_pain: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" =>]
  enum diarrhea: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" =>]
  enum pneumonia: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" =>]
  enum ardc: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" =>]
  enum have_etiologi: ["Ya" => 2, "Tidak Tahu" => 1, "Tidak" =>]

  scope :this_month, -> { where(interview_date: Time.now.beginning_of_month..Time.now.end_of_month) }

  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  
  # has_one :first, class_name: 'LSix::Second', foreign_key: :l_six_first_id, dependent: :destroy

  belongs_to :hospital, class_name: 'Main::Hospital', foreign_key: :main_hospital_id
  belongs_to :ls_first, class_name: 'LSix::First', foreign_key: :ls_six_first_id
end
