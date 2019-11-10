class Post < ApplicationRecord
	attachment :posted_image
	belongs_to :user
	belongs_to :stadium
	 has_many :favorites

	 def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
     end
end
