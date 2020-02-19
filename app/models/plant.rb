class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :price, :disponibility, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
