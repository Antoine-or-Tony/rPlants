class Plant < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, :price, :disponibility, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
