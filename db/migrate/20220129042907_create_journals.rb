class CreateJournals < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.text :notes
      t.date :journal_date
      t.integer :trade_id
      t.timestamps
    end
  end
end
