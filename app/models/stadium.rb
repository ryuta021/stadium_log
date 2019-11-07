class Stadium < ApplicationRecord
	 geocoded_by :address
    after_validation :geocode
	has_many :post
	attachment :image
end
