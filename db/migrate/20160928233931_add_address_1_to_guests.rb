class AddAddress1ToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :address_1, :string
  end
end
