class User < ApplicationRecord
  has_many :recipes
  has_many :likes
  has_many :comments
  has_many :saved_recipes
  has_many :rankings
  has_many :ingredients

  has_secure_password
  validates :username, uniqueness: true
end
