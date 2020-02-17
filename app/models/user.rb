class User < ApplicationRecord
  has_many :plants
  validates :username, presence: true, uniqueness: true
  validates :firstname, :lastname, presence: true
end
