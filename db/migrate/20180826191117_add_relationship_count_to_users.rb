class AddRelationshipCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :relationships_count, :integer
  end
end
