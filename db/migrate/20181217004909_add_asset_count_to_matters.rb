class AddAssetCountToMatters < ActiveRecord::Migration[5.1]
  def change
    add_column :matters, :assets_count, :integer
  end
end
