class Post < ApplicationRecord
	attachment :posted_image
	belongs_to :user
	belongs_to :stadium
end
