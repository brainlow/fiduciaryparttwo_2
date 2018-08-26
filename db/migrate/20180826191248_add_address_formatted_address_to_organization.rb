class AddAddressFormattedAddressToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :address_formatted_address, :string
  end
end
