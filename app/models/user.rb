class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable

  # has_secure_password
  has_many :notifications, as: :recipient
  has_many :messages
  has_many :rooms

  validates :password, presence: true, confirmation: true
  validates :phone, numericality: { only_integer: true }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: ' is not correct' },
                    length: { maximum: 100 }, uniqueness: true, presence: true
end
