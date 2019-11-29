class Spot < ApplicationRecord
	 belongs_to :plan
	 attachment :spots_image
	  geocoded_by :address
    after_validation :geocode
end



