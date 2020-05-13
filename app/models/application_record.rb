class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #untuk generate uuid gasan friendly_id di pake oleh function private slug_candidates
  def generate_uuid
    SecureRandom.uuid
  end

  def generate_uuid_baseontime
      (Time.now.to_f * 1000000).to_i
  end
  #=======================

  private

  #ini fungsi bawaan dari friendly_id, berfungsi untuk menggunakan slug custom dari friendly id
  def slug_candidates
      [
          [:generate_uuid_baseontime, :generate_uuid]
      ]
  end
end
