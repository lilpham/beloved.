class AddCostToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :cost, :integer
  end
end
