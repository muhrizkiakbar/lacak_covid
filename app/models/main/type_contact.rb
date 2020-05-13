class Main::TypeContact < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

end
