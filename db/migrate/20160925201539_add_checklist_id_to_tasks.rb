class AddChecklistIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :checklist_id, :integer
  end
end
