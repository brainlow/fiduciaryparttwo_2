class AddMailAddressLatitudeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mail_address_latitude, :float
  end
end
