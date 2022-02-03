class Trade < ApplicationRecord
    belongs_to :user
    belongs_to :type 
    belongs_to :perpetual
    has_many :journals, :dependent => :delete_all
    validates :platform, :symbol, :leverage, :entry_date, :entry_price, :entry_amount, :exit_price, :exit_date,  presence: true 
    validates :entry_amount, :entry_price, :exit_price, numericality: { :greater_than  => 0 }


    def self.push_data(trade)
        if trade.perpetual.perpetual_type == 'long'
            trade.profit =  self.calc_long(trade.entry_price, trade.exit_price, trade.entry_amount, trade.leverage)
        else
            trade.profit =  self.calc_short(trade.entry_price, trade.exit_price, trade.entry_amount, trade.leverage)
        end 
        return trade
    end

    def self.calc_long(entry_price, exit_price, amount, leverage)
        leverage = leverage == 0 ? 1 : leverage
        #Formula ((1 / Futures Entry Price) - (1 / Futures Exit Price)) * Position Size
        position = (amount / entry_price)
        pnl = position * (exit_price - entry_price )
        result = pnl * leverage
        result
    end
    
    
    def self.calc_short(entry_price, exit_price, amount, leverage)
        leverage = leverage == 0 ? 1 : leverage
        position = (amount / entry_price)
        pnl = position * ( entry_price - exit_price )
        result = pnl * leverage
        result
    end
 

end
