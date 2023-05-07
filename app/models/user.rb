class User < ApplicationRecord
  has_many :recipes
  has_many :likes
  has_many :comments
  has_many :saved_recipes
  has_many :rankings
  has_many :ingredients

  has_secure_password
  validates :username, uniqueness: true, length: { minimum: 3, maximum: 200 }, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters, numbers, and spaces" }
  validates :email, presence: true, uniqueness: true ,length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :country, presence: true, length: { minimum: 3, maximum: 200 }
  validates :public_name, presence: true, length: { minimum: 3, maximum: 200 }, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters, numbers, and spaces" }
  validates :bio, length: { minimum: 1, maximum: 3500 }
end
