class ChangeTransactionIdToTradeId < ActiveRecord::Migration[5.2]
  def change
    #rename_column :journals, :transaction_id, :trade_id
  end
end
