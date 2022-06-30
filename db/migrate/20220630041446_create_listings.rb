class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :cuisine
      t.string :allergy
      t.integer :price
      t.string :available_date
      t.boolean :sold, default: false

      t.timestamps
    end
  end
end
