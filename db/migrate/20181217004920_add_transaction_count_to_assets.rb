class AddTransactionCountToAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :assets, :transactions_count, :integer
  end
end
