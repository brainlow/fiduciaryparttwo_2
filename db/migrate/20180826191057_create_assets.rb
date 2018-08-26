class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :matter_id
      t.float :amount
      t.string :description
      t.float :shares
      t.date :acq_date
      t.string :asset_type
      t.string :ticker
      t.string :account_number
      t.string :institution
      t.string :account_type

      t.timestamps

    end
  end
end
