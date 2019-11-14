class Team < ApplicationRecord
	has_many :user
	# validates :team, presence: true
end
