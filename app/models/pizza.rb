class Pizza < ApplicationRecord
    # A Pizza can be associated with multiple RestaurantPizzas
    has_many :restaurant_pizzas
    # A Pizza can be associated with multiple Restaurants through RestaurantPizzas
    has_many :restaurants, through: :restaurant_pizzas
end
