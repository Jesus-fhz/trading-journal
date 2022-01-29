class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.date :dob

      t.timestamps
    end
  end
end
