class RemovePriceFromExpenses < ActiveRecord::Migration[5.0]
  def change
    remove_column :expenses, :price, :integer
  end
end
