class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, length: { minimum: 3, maximum: 200 },
                   format: { with: /\A[a-zA-Z0-9\s]+\z/, message: 'only allows letters, numbers, and spaces' }
  # validates :photo, presence: true
  validates :description, length: { minimum: 15 }
end
