class Post < ApplicationRecord

  validates :post_content, length: { minimum: 1, maximum: 120 }
  validates :watching_date, presence: true
  validates :stadium_id, presence: true
  validates :access_rate, presence: true
  validates :gouremet_rate, presence: true
  validates :sightseeing_rate, presence: true
  validates :mood_rate, presence: true
  validates :capacity_rate, presence: true

  attachment :posted_image

	belongs_to :user
	belongs_to :stadium
	has_many :favorites, dependent: :destroy
  has_many :plans, dependent: :destroy
  accepts_nested_attributes_for :plans, reject_if: :all_blank, allow_destroy: true

  geocoded_by :address
  after_validation :geocode


  def get_total_rate(user_id)
       gouremet_rate + sightseeing_rate + mood_rate + capacity_rate
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

end
