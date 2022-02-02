class CreatePerpetuals < ActiveRecord::Migration[5.2]
  def change
    create_table :perpetuals do |t|
      t.string :type

      t.timestamps
    end
  end
end
