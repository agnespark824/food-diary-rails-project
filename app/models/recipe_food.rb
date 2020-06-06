class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :servings, presence: true
end
