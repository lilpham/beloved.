class RemoveDescriptionFromChecklists < ActiveRecord::Migration[5.0]
  def change
    remove_column :checklists, :description, :text
  end
end
