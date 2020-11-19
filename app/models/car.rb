class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :user, presence: true
  validates :model, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
