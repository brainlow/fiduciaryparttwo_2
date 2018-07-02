class AddAddressLongitudeToFiduciary < ActiveRecord::Migration[5.0]
  def change
    add_column :fiduciaries, :address_longitude, :float
  end
end
