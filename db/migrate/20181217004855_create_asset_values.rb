class CreateAssetValues < ActiveRecord::Migration[5.1]
  def change
    create_table :asset_values do |t|
      t.integer :asset_id
      t.date :date
      t.float :amount
      t.float :shares

      t.timestamps
    end
  end
end
