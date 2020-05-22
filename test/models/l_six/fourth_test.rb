# == Schema Information
#
# Table name: l_six_fourths
#
#  id                           :bigint           not null, primary key
#  l_six_first_id               :bigint
#  abroad                       :decimal(, )
#  abroad_destination           :hstore
#  out_town                     :decimal(, )
#  out_town_destination         :hstore
#  hospital                     :decimal(, )
#  hospital_destination         :hstore
#  animal_market                :decimal(, )
#  animal_market_destination    :hstore
#  contact_pdp                  :decimal(, )
#  contact_pdp_destination      :hstore
#  contact_positive             :decimal(, )
#  contact_positive_destination :hstore
#  medic_officer                :decimal(, )
#  explain_of_procedure_alcohol :text
#  is_goggle                    :boolean
#  isn_apd                      :boolean
#  is_n99_ffp3                  :boolean
#  is_n95_ffp2                  :boolean
#  is_gloves                    :boolean
#  is_medic_mask                :boolean
#  is_gown                      :boolean
#  is_procedure                 :boolean
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  slug                         :string
#  deleted_at                   :datetime
#
require 'test_helper'

class LSix::FourthTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
