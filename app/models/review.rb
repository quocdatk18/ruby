class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :book

  enum :state, %i[not_reviewed published hidden]

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { in: 20..300 }
  validates :rating, length: { in: 1..5 }, numericality: { only_integer: true }
  validates :customer_id, uniqueness: true
end
