class ChangeColumnTypePerpetual < ActiveRecord::Migration[5.2]
  def change
    rename_column :perpetuals, :type, :perpetual_type
  end
end
