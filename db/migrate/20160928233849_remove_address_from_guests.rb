class RemoveAddressFromGuests < ActiveRecord::Migration[5.0]
  def change
    remove_column :guests, :address, :string
  end
end
