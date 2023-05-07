class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :comment_text, presence: true, length: { minimum: 1, maximum: 3500 }
  validates :deleted, inclusion: [true, false]
end
