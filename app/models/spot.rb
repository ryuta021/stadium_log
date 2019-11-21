class Spot < ApplicationRecord
	 belongs_to :plan
	 attachment :spots_image
end


