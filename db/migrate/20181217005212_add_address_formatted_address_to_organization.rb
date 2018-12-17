class AddAddressFormattedAddressToOrganization < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :address_formatted_address, :string
  end
end
