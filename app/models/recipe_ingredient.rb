class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, presence: true, length: { maximum: 50, minimum: 1 }
  validates :unit, presence: true, length: { minimum: 1, maximum: 50 }
  validates :optional, inclusion: [true, false]
end
