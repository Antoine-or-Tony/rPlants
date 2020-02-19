class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo
  validates :name, :price, :disponibility_start, :disponibility_end, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
