class AddAddressLatitudeToBeneficiary < ActiveRecord::Migration[5.0]
  def change
    add_column :beneficiaries, :address_latitude, :float
  end
end
