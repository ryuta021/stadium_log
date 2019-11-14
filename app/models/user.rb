class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team
  attachment :image
  has_many :post
  has_many :favorites
  has_many :favorite_post, through: :favorites, source: :post
end
