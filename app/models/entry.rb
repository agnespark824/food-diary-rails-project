class Entry < ApplicationRecord
    belongs_to :user
    has_many :entry_foods
    has_many :foods, through: :entry_foods

    validates :date, presence: true  
    validates :date, uniqueness: true

    accepts_nested_attributes_for :foods, reject_if: proc { |attributes| attributes['name'].blank? }
    accepts_nested_attributes_for :entry_foods

end
