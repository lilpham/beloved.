class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :category
      t.string :payer
      t.boolean :paid

      t.timestamps
    end
  end
end
