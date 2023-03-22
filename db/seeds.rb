# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Seeding data'
# Create some Pizzas
pizza1 = Pizza.create(name: 'Margherita', ingredients: 'Tomato sauce, mozzarella, basil')
pizza2 = Pizza.create(name: 'Pepperoni', ingredients: 'Tomato sauce, mozzarella, pepperoni')
pizza3 = Pizza.create(name: 'Hawaiian', ingredients: 'Tomato sauce, mozzarella, ham, pineapple')

# Create some Restaurants
restaurant1 = Restaurant.create(name: 'Papa John\'s', address: '123 Main St')
restaurant2 = Restaurant.create(name: 'Pizza Hut', address: '456 Oak Ave')
restaurant3 = Restaurant.create(name: 'Domino\'s', address: '789 Elm St')

# Create some RestaurantPizzas (associating Pizzas with Restaurants)
RestaurantPizza.create(pizza: pizza1, restaurant: restaurant1, price: 10.99)
RestaurantPizza.create(pizza: pizza2, restaurant: restaurant1, price: 12.99)
RestaurantPizza.create(pizza: pizza3, restaurant: restaurant2, price: 11.99)
RestaurantPizza.create(pizza: pizza1, restaurant: restaurant3, price: 9.99)


puts 'Done Seeding data'