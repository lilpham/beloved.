class AddAddress2ToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :address_2, :string
  end
end
