class AddAddressLongitudeToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :address_longitude, :float
  end
end
