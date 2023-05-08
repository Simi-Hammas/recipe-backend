class Like < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :liked, inclusion: [true, false]
end
