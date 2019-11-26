class Stadium < ApplicationRecord

	validates :name, presence: true
	 # validates :image_id, presence: true
	 validates :information, presence: true
	validates :address, presence: true
	 has_many :post
	 attachment :image
    geocoded_by :address
    after_validation :geocode



end

