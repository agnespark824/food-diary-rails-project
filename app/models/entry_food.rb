class EntryFood < ApplicationRecord
    belongs_to :entry
    belongs_to :food

    validates :entry_id, presence: true
    validates :food_id, presence: true

end
  