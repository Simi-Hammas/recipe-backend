class User < ApplicationRecord
  has_many :recipes
  has_many :likes
  has_many :comments
  has_many :saved_recipes
  has_many :rankings
  has_many :ingredients

  has_secure_password
  validates :username, uniqueness: true, length: { minimum: 3, maximum: 200 },
                       format: { with: /\A[a-zA-Z0-9\s\-_]+\z/, message: 'only allows letters, numbers,\
                         spaces, dashes, and underscores' }
  validates :email, presence: true, uniqueness: true, length: { minimum: 6, maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email address' }
  validates :country, presence: true, length: { minimum: 3, maximum: 60 },
                      format: { with: /\A[A-Za-z]+(?: [A-Za-z]+)?\z/ }
  validates :public_name, presence: true, length: { minimum: 3, maximum: 200 },
                          format: { with: /\A[a-zA-Z0-9\s\-_]+\z/, message: 'only allows letters, numbers,\
    spaces, dashes, and underscores' }
  validates :bio, length: { minimum: 1, maximum: 3500 }
  validates :recipes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :saved_recipes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
