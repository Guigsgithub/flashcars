class Car < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :availability, presence: true
  validates :model, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
end
