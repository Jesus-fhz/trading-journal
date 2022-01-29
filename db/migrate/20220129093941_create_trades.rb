class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.date :entry_date
      t.string :platform
      t.string :symbol
      t.float :entry_price
      t.float :entry_amount
      t.integer :leverage
      t.date :exit_date
      t.float :exit_price
      t.integer :type_id
      t.integer :user_id

      t.timestamps
    end
  end
end
