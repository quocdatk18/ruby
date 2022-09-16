class Order < ApplicationRecord
  belongs_to :customer
  has_and_belongs_to_many :books, join_table: 'book_orders'

  enum status: %i[shipped being_packed complete cancelled]

  scope :created_before, ->(time) { where('created_at < ?', time) }

  validates :books, length: { maximum: 5, message: 'Each order is allowed to order up to 5 books' }
  validate :not_repeat!, :not_order!

  def not_repeat!
    return if books.uniq == books

    errors.add(:books, "Can't repeat 1 book in 1 order")
  end

  def not_order!
    return if Order.where.not(status: :complete).where(customer: customer).size.zero?

    errors.add(:orders, 'Do not order if there is an order being processed')
  end
end
