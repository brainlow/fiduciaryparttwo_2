class AddMatterCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :matters_count, :integer
  end
end
