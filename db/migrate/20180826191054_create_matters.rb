class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :matter_type
      t.string :matter_name
      t.string :matter_number
      t.string :matter_state
      t.string :matter_county

      t.timestamps

    end
  end
end
