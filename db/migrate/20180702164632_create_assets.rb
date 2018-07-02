class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :matter_id
      t.float :beg_value
      t.float :end_value
      t.string :description
      t.float :beg_shares
      t.float :end_shares
      t.date :beg_date
      t.string :asset_type

      t.timestamps

    end
  end
end
