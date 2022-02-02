class AddColumnToTrades < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :profit, :float
  end
end
