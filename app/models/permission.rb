# == Schema Information
#
# Table name: permissions
#
#  id          :bigint           not null, primary key
#  name        :string
#  resource    :string
#  action      :string
#  path        :string
#  description :string
#  page        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#  deleted_at  :datetime
#
class Permission < ApplicationRecord
end
