class AddAddressFormattedAddressToFiduciary < ActiveRecord::Migration[5.0]
  def change
    add_column :fiduciaries, :address_formatted_address, :string
  end
end
