class Review < ApplicationRecord
  belongs_to :car
  RATINGS = [1, 2, 3, 4, 5]
  validates :rating, inclusion: { in: RATINGS }
  validates :content, presence: true
  validates :rating, presence: true
end
