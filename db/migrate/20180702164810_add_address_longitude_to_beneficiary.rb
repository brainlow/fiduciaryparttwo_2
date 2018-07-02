class AddAddressLongitudeToBeneficiary < ActiveRecord::Migration[5.0]
  def change
    add_column :beneficiaries, :address_longitude, :float
  end
end
