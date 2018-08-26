class AddMailAddressFormattedAddressToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mail_address_formatted_address, :string
  end
end
