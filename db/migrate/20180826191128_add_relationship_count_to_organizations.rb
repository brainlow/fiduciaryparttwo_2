class AddRelationshipCountToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :relationships_count, :integer
  end
end
