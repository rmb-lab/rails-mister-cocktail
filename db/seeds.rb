# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Cleaning database...'

# INGREDIENTS
# Ingredient.destroy_all

puts 'Creating ingredients...'
# ingredients_attributes = [
#   {
#     name: 'lemon'
#   },
#   {
#     name: 'ice'
#   },
#   {
#     name: 'mint leaves'
#   },
#   {
#     name: 'rhum'
#   }
# ]
# Ingredient.create!(ingredients_attributes)

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
result = JSON.parse(ingredients_serialized)
ingredients = result['drinks']

ingredients.each do |ingredient|
  ingredient.each do |key, value|
    Ingredient.create!(name: value)
  end
end

# COCKTAILS
Cocktail.destroy_all

puts 'Creating cocktails...'
cocktails_attributes = [
  {
    name: 'mojito'
  },
  {
    name: 'moscow mule'
  },
  {
    name: 'margarita'
  },
  {
    name: 'daikiri'
  }
]
Cocktail.create!(cocktails_attributes)
puts 'Finished!'
