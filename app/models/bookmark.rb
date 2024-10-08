class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category

  validates :recipe_id, uniqueness: { scope: :category_id, message: "is already bookmarked in this category" }
  validates :comment, length: { minimum: 6, too_short: "must have at least 6 characters" }
end
