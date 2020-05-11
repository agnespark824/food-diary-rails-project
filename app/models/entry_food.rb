class EntryFood < ApplicationRecord
    belongs_to :entry
    belongs_to :food
end
  