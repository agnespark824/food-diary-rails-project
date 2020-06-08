class Recipe < ApplicationRecord
    has_many :recipe_foods
    has_many :foods, through: :recipe_foods

    validates :name, presence: true

    accepts_nested_attributes_for :recipe_foods, reject_if: proc { |attributes| attributes['servings'].blank? }
end
