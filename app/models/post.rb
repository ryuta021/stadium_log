class Post < ApplicationRecord

  #validates :post_content, presence: true
  #validates :watching_date, presence: true
  #validates :stadium_id, presence: true
  attachment :posted_image

	belongs_to :user
	belongs_to :stadium
	has_many :favorites, dependent: :destroy
  has_many :plans, dependent: :destroy
  accepts_nested_attributes_for :plans, reject_if: :all_blank, allow_destroy: true

  geocoded_by :address
  after_validation :geocode


 def total_rate
  access_rate + gouremet_rate + sightseeing_rate + mood_rate + capacity_rate
 end

  def like_user(user_id)
   favorites.find_by(user_id: user_id)
  end

  def within_box(distance, latitude, longitude)
      distance = distance
      center_point = [latitude, longitude]
      box = Geocoder::Calculations.bounding_box(center_point, distance)
      self.within_bounding_box(box)
  end


  # def geocode
  #   uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyBXVVA0A41o5mRG_hSO9KrzOp73q5ES91c")
  #   res = HTTP.get(uri).to_s
  #   response = JSON.parse(res)
  #   self.latitude = response["results"][0]["geometry"]["location"]["lat"]
  #   self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  # end
end
