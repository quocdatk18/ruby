class Customer < ApplicationRecord
  has_many :orders, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  # scope
  scope :customer_order_supplier, lambda { |supplier_id|
    joins(orders: { books: :supplier }).where(books: { supplier_id: supplier_id }).distinct
  }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: ' email is not correct' },
                    length: { maximum: 100 }, uniqueness: true
end
