class Recipe < ApplicationRecord
    has_many :recipe_foods

    validates :name, presence: true

    accepts_nested_attributes_for :foods, reject_if: proc { |attributes| attributes['name'].blank? }
    accepts_nested_attributes_for :recipe_foods, reject_if: proc { |attributes| attributes['servings'].blank? }
end
