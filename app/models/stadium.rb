class Stadium < ApplicationRecord
	 has_many :post
	 attachment :image
   geocoded_by :address
   # after_validation :geocode
   after_validation :geocode, if: :address_changed?



 private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyBXVVA0A41o5mRG_hSO9KrzOp73q5ES91c")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end
end