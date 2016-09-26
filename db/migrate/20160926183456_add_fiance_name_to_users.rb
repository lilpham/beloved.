class AddFianceNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fiance_name, :string
  end
end
