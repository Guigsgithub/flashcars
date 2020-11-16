class Car < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :availability, presence: true
  validates :model, presence: true
  validates :price, presence: true
end
