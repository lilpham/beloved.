class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.boolean :complete
      t.boolean :urgent
      t.date :deadline

      t.timestamps
    end
  end
end
