class Trade < ApplicationRecord
    belongs_to :user
    belongs_to :type 
    has_many :journals, :dependent => :delete_all
    validates :platform, :symbol, :leverage, :entry_date, :entry_price, :entry_amount, :exit_price, :exit_date,  presence: true 
    validates :entry_amount, :entry_price, :exit_price, numericality: { :greater_than  => 0 }
end
