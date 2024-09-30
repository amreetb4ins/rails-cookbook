class Recipe < ApplicationRecord
  has_many :bookmarks, :categories
end
