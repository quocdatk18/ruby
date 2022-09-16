class Book < ApplicationRecord
  belongs_to :supplier
  belongs_to :author
  has_many :reviews, dependent: :delete_all
  has_and_belongs_to_many :orders, join_table: 'book_orders'

  ## scope
  scope :book_review_user, ->(email) { joins(reviews: :customer).where(customers: { email: email }).distinct }

  validates :title, presence: true, length: { maximum: 255 }
  validates :author_id, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :price, presence: true, length: { in: 1..200 }
end
