class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  ## scope
  scope :author_user_oder, lambda { |customer_id|
    joins(books: :orders).where(orders: { customer_id: customer_id }).distinct
  }
  ## method
  def self.author_income_max
    joins(books: :orders)
      .select('orders.*, sum(orders.total) AS sum_total')
      .group(:id)
      .order(sum_total: :desc)
      .first
  end

  def self.author_best_book(conut_rating)
    joins(books: :reviews)
      .select('authors.*,sum(reviews.rating) AS rating_up')
      .group(:id)
      .order(rating_up: :desc)
      .limit(conut_rating)
  end
end
