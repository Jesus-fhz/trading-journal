class Journal < ApplicationRecord
    belongs_to :trade, optional: true
end
