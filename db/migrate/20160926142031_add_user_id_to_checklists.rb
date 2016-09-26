class AddUserIdToChecklists < ActiveRecord::Migration[5.0]
  def change
    add_column :checklists, :user_id, :integer
  end
end
