class Supplier < ApplicationRecord
  has_many :books, dependent: :delete_all
  has_many :authors, through: :books

  ## method
  def self.suppliers_income_max
    joins(books: :orders)
      .select('orders.*, count(book_orders.id) AS conut_total')
      .group(:id)
      .order(conut_total: :desc)
      .first
  end
end
