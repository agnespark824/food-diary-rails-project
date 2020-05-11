# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
EntryFood.delete_all
RecipeFood.delete_all
Recipe.delete_all
Food.delete_all
Entry.delete_all
User.delete_all

u = User.create!(email: 'test', password: 'test')
apple = Food.create!(name:"apple", calories: 40, serving_size: 1)

e = u.entries.create!
e.entry_foods.create!(food:apple, servings: 2)

ice = Food.create!(name: 'ice', calories: 0, serving_size: 1)

r = Recipe.create!(name: "apple smoothie")

r.recipe_foods.create!(food: ice, servings: 20)
r.recipe_foods.create!(food: apple, servings: 2)