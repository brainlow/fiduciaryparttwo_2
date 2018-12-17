class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :asset_id
      t.float :shares
      t.date :date
      t.float :amount
      t.text :category
      t.text :description
      t.text :payee
      t.boolean :distribution

      t.timestamps
    end
  end
end
