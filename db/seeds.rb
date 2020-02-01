# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'

# INGREDIENTS
Ingredient.destroy_all

puts 'Creating ingredients...'
ingredients_attributes = [
  {
    name: 'lemon'
  },
  {
    name: 'ice'
  },
  {
    name: 'mint leaves'
  },
  {
    name: 'rhum'
  }
]
Ingredient.create!(ingredients_attributes)

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
