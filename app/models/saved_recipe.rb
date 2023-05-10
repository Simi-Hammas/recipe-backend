class SavedRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :saved, inclusion: [true, false]
  validates :notes, length: { maximum: 3500 }
end
