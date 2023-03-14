# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

<<<<<<< HEAD
# Users
User.create(name: "John", role: "admin")
User.create(name: "Jane", role: "user")

# Foods
Food.create(name: "Apples", measurement_unit: "kg", price: 5, quantity: 10, user_id: 1)
Food.create(name: "Chicken", measurement_unit: "lb", price: 8, quantity: 5, user_id: 2)

# Recipes
Recipe.create(name: "Apple Pie", preparation_time: 20, cooking_time: 40, description: "A delicious homemade apple pie recipe.", public: true, user_id: 1)
Recipe.create(name: "Grilled Chicken", preparation_time: 10, cooking_time: 20, description: "A quick and easy grilled chicken recipe.", public: false, user_id: 2)

# RecipeFoods
RecipeFood.create(quantity: 2, user_id: 1, food_id: 1)
RecipeFood.create(quantity: 1, user_id: 2, food_id: 2)
=======

# User.destroy_all
# Food.destroy_all

# User seeder
# first_user = User.create(name: 'Mancoba', role: 'user', email: 'mancoba@gmail.com')
# second_user = User.create(name: 'Clement', role: 'admin', email: 'admin@gmail.com')

first_user = User.first
second_user = User.second

p "Created #{User.count} Users"

# Food seeder
food_1 = Food.create(user: first_user, name: 'Apple', measurement_unit: 'grams', price: 5, quantity: 10)
food_2 = Food.create(user: first_user, name: 'Pineapple', measurement_unit: 'grams', price: 1, quantity: 10)
food_3 = Food.create(user: second_user, name: 'Chicken breasts', measurement_unit: 'units', price: 2, quantity: 5)


p "Created #{Food.count} Foods"

>>>>>>> add-login
