class AddAddressLatitudeToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :address_latitude, :float
  end
end
