class Recipe < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :saved_recipes
  has_many :rankings
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
  validates :description, presence: true, length: { minimum: 15 }
  validates :method, presence: true, length: { minimum: 15 }
  validates :preparation_time, presence: true,
                               numericality: { only_integer: true, less_than_or_equal_to: 9999,
                                               greater_than: 0 }
  validates :cooking_time, presence: true,
                           numericality: { only_integer: true, less_than_or_equal_to: 9999,
                                           greater_than_or_equal_to: 0 }
  validates :ease_of_preparation, presence: true
  validates :photo, presence: true
  validates :recipe_type, presence: true
  validates :country, presence: true, format: { with: /\A[A-Za-z]+(?: [A-Za-z]+)?\z/ },
                      length: { minimum: 3, maximum: 60 }
  validates :accessible, inclusion: [true, false]
  validates :deleted_recipe, inclusion: [true, false]
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
