class Entry < ApplicationRecord
    belongs_to :user
    has_many :entry_foods
    has_many :foods, through: :entry_foods

end
