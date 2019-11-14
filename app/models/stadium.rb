class Stadium < ApplicationRecord
	 has_many :post
	 attachment :image
   geocoded_by :address
   after_validation :geocode



 # private
 #  def geocode
 #    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyDgRNuMMQ26SbHwrGQmhxfrS4kjcuygGbI")
 #    res = HTTP.get(uri).to_s
 #    response = JSON.parse(res)
 #    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
 #    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
 #  end
end
