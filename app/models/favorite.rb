class Favorite < ApplicationRecord
    belongs_to :post, counter_cache: :favorite_count
    belongs_to :user
end
