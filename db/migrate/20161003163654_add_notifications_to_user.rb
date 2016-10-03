class AddNotificationsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :notifications, :string
  end
end
