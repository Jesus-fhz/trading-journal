class Trade < ApplicationRecord
    belongs_to :user , optional: true
    belongs_to :type 
    has_many :journals, :dependent => :delete_all
end
