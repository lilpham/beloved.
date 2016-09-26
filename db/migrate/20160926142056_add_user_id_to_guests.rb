class AddUserIdToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :user_id, :integer
  end
end
