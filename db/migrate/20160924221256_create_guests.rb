class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.text :notes
      t.boolean :plus_one
      t.string :party_name

      t.timestamps
    end
  end
end
