class AddStateToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :state, :string
  end
end
