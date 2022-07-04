class AddAllergiesReferencesToListings < ActiveRecord::Migration[6.1]
  def change
    add_reference :listings, :allergy, foreign_key: true
  end
end
