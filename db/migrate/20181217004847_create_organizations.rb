class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :url
      t.integer :user_id
      t.string :logo

      t.timestamps
    end
  end
end
