class ChangeIsadminDefaultValueInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :isadmin, 'false'
  end
end
