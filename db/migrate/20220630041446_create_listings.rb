class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :cuisine
      t.integer :price
      t.string :available_date
      # FIX: address here?
      t.boolean :sold, default: false
      t.references :allergy, null:false, foreign_key: true

      t.timestamps
    end
  end
end
