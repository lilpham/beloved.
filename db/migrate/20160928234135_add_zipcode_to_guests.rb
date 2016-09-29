class AddZipcodeToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :zipcode, :string
  end
end
