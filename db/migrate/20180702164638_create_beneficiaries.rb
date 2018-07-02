class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :matter_id

      t.timestamps

    end
  end
end
