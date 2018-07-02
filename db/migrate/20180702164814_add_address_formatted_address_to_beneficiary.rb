class AddAddressFormattedAddressToBeneficiary < ActiveRecord::Migration[5.0]
  def change
    add_column :beneficiaries, :address_formatted_address, :string
  end
end
