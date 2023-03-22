class RestaurantPizza < ApplicationRecord
  # A RestaurantPizza belongs to a Pizza
  belongs_to :pizza
  # A RestaurantPizza belongs to a Restaurant
  belongs_to :restaurant

  # Validates that the price of a RestaurantPizza is within a certain range
  validates :price, inclusion: { in: 1..30 }
end
