class Team < ApplicationRecord
	# validates :team, presence: true
	 has_many :users
end

