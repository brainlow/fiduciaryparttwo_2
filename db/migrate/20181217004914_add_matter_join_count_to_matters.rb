class AddMatterJoinCountToMatters < ActiveRecord::Migration[5.1]
  def change
    add_column :matters, :matter_joins_count, :integer
  end
end
