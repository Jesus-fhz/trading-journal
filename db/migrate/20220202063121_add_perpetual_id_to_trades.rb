class AddPerpetualIdToTrades < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :perpetual_id, :integer
  end
end
