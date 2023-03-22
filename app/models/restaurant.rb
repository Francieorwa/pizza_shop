class Restaurant < ApplicationRecord
    # A Restaurant can be associated with multiple RestaurantPizzas
    has_many :restaurant_pizzas
    # A Restaurant can be associated with multiple Pizzas through RestaurantPizzas
    has_many :pizzas, through: :restaurant_pizzas, dependent: :destroy
end
