class Recipe < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :saved_recipes
  has_many :rankings
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
