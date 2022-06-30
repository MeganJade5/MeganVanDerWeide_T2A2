class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street_number
      t.string :street_name
      t.string :suburb
      t.integer :postcode

      t.timestamps
    end
  end
end
