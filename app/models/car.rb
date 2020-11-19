class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy

  validates :user, presence: true
  validates :model, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  has_one_attached :photo
end
