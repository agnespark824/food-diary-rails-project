class Meal < ApplicationRecord
    has_many :foods
    belongs_to :daily_entry 
end
