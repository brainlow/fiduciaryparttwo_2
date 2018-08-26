class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.string :role
      t.integer :matter_id
      t.integer :organization_id

      t.timestamps

    end
  end
end
