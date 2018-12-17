class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
      t.integer :matter_id
      t.string :description
      t.string :asset_type
      t.string :ticker
      t.string :account_number
      t.string :institution
      t.string :account_type

      t.timestamps
    end
  end
end
