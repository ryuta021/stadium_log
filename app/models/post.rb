class Post < ApplicationRecord
	attachment :posted_image
	belongs_to :user
	belongs_to :stadium
	has_many :favorites, dependent: :destroy



  def like_user(user_id)
   favorites.find_by(user_id: user_id)
  end

    geocoded_by :address
    after_validation :geocode




  # def geocode
  #   uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyBXVVA0A41o5mRG_hSO9KrzOp73q5ES91c")
  #   res = HTTP.get(uri).to_s
  #   response = JSON.parse(res)
  #   self.latitude = response["results"][0]["geometry"]["location"]["lat"]
  #   self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  # end
end
