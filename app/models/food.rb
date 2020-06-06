class Food < ApplicationRecord
    has_many :entry_foods
    has_many :recipe_foods

    validates :name, presence: true
    validates :serving_unit, presence: true
    validates :serving_size, presence: true
    validates :calories, presence: true
end

