class Plan < ApplicationRecord

  belongs_to :post
   has_many :spots, dependent: :destroy
  #has_many  :spots, inverse_of: :plan
  accepts_nested_attributes_for :spots, reject_if: :all_blank, allow_destroy: true
  # validates :disc_no, presence: true
end


