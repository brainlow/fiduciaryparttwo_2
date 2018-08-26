class AddMailAddressLongitudeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mail_address_longitude, :float
  end
end
