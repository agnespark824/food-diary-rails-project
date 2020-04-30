class DailyEntry < ApplicationRecord
    belongs_to :user
    has_many :meals
    has_many :foods, through: :meals

    def meals_attributes=(meals_attributes)
        meals_attributes.values.each do |meal_attributes|
            self.meals.build(meal_attributes)
        end
    end


end
