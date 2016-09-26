class AddWeddingDateToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :wedding_date, :date
  end
end
