class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :role
      t.integer :user_id
      t.integer :matter_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
