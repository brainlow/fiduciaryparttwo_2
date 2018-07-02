class AddAddressLatitudeToFiduciary < ActiveRecord::Migration[5.0]
  def change
    add_column :fiduciaries, :address_latitude, :float
  end
end
