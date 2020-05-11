class Food < ApplicationRecord
    has_many :entry_foods
    has_many :recipe_foods
end
