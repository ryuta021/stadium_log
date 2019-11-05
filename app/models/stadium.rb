class Stadium < ApplicationRecord
	has_many :post
	attachment :image
end
