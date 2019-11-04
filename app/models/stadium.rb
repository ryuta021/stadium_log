class Stadium < ApplicationRecord
	has_many :post
	attachment :stadium_image
end
