class Recipe < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :saved_recipes
  has_many :rankings
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :title, presence: true, length: { minimum: 4, maximum: 200 }
  validates :description, presence: true, length: { minimum: 15 }
  validates :method, presence: true, length: { minimum: 15 }
  validates :preparation_time, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 9999 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 9999 }
  validates :ease_of_preparation, presence: true
  validates :photo, presence: true
  validates :recipe_type, presence: true
  validates :country, presence: true, format: { with: /[a-zA-Z]/ }, length: { minimum: 4, maximum: 50 }
  validates :accessible, inclusion: [true, false]
  validates :deleted_recipe, inclusion: [true, false]
end
