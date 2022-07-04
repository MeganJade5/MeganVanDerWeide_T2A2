# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

allergies = ["nut free", "gluten free", "Vegan", "shellfish free", "vegetarian", "pork free", "N/A"]

if Allergy.count == 0
    allergies.each do |allergy|
        Allergy.create(name: allergy)
        puts "created with #{allergy} allergy"
    end
end