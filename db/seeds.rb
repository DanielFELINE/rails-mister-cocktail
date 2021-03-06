# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'seeding ingredients.. '
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
ingredients["drinks"].each do |item|
    Ingredient.create(name: "#{item["strIngredient1"]}")
end

puts 'cleaning cocktails with no picture..'

Cocktail.all.each do |cocktail|
    if cocktail.photo.blank?
        cocktail.doses.each do |dose|
            dose.delete
        end
        cocktail.delete 
    puts "deleted the cocktail : #{cocktail.name}"
    else
    end
end
