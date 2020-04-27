class Food < ApplicationRecord
    has_many :meals_foods
    has_many :meals, through: :meals_foods
end
