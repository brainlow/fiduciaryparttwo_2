class CreateOccupations < ActiveRecord::Migration[5.1]
  def change
    create_table :occupations do |t|
      t.integer :user_id
      t.integer :organization_id
      t.string :role

      t.timestamps
    end
  end
end
