# == Schema Information
#
# Table name: telegram_message_ili_reporters
#
#  id                                  :bigint           not null, primary key
#  telegram_username_reporter_id       :bigint
#  chat_id                             :string
#  username_telegram                   :string
#  message                             :text
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#  deleted_at                          :datetime
#  slug                                :string
#  main_patient_id                     :bigint
#  telegram_message_report_reporter_id :bigint
#  user_id                             :bigint
#  message_id                          :string
#
class Telegram::MessageIliReporter < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  has_one :ls_first, class_name: 'LSix::First', foreign_key: :telegram_message_ili_reporter_id

  scope :newest_first, -> { order(created_at: :asc) }

    def self.search options
        self.ransack(options)
    end
  def message_select
    "#{message} - #{created_at.strftime("%d-%m-%Y")}"
  end

  def rw_rt_username_message
    "#{citizen_association.citizen_association} - #{neighborhood_association.neighborhood_association} - #{message} "
  end

  belongs_to :message_report_reporter, class_name: 'Telegram::MessageReportReporter', foreign_key: :telegram_message_report_reporter_id
  
  belongs_to :patient, class_name: 'Main::Patient', foreign_key: :main_patient_id, optional: true
  belongs_to :user, class_name: 'User', foreign_key: :user_id, optional: true

  belongs_to :username_reporter, class_name: 'Telegram::UsernameReporter', foreign_key: :telegram_username_reporter_id

  def username_reporter
    Telegram::UsernameReporter.unscoped {super}
  end

  def patient
    Main::Patient.unscoped {super}
  end
  def user
    User.unscoped {super}
  end


end
