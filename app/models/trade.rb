class Trade < ApplicationRecord
    belongs_to :user
    belongs_to :type 
    has_many :journals
end
