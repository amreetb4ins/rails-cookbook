class Recipe < ApplicationRecord
  has_many :bookmarks, :categories

  validates :description, presence: true
  validates :name, uniqueness: true
  validates :rating, numericality: { in: 0..10 }
end
