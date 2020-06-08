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
apple = Food.create!(name:"Apple", calories: 80, serving_size: 60, serving_unit: "g")

e = u.entries.create!(date: Date.today)
#e.entry_food.create!(food: apple, servings: 2, meal: "Snack")

ice = Food.create!(name: 'Ice', calories: 0, serving_size: 5, serving_unit: "g")

r = Recipe.create!(name: "Apple Smoothie")

#r.recipe_food.create!(food: ice, servings: 1)
#r.recipe_food.create!(food: apple, servings: 0.5)