class Booking < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  has_many :reviews
  validates :start_date, :end_date, :total_price, presence: true
end
