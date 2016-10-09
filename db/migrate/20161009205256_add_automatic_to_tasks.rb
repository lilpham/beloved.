class AddAutomaticToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :automatic, :boolean
  end
end
