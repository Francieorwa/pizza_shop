class RestaurantPizzasController < ApplicationController
  # Handle ActiveRecord::RecordInvalid exceptions and return an Unprocessable Entity response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # Create a new RestaurantPizza object with the provided params
  # If successful, return the Pizza object associated with the RestaurantPizza
  # If unsuccessful, return an Unprocessable Entity response with error messages
  def create
      restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
      render json: restaurant_pizza.pizza, only: [:id, :name, :ingredients]
    rescue ActiveRecord::RecordInvalid
      render json: { errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
    end
  
    private
  
    # Define the allowed parameters for creating a new RestaurantPizza object
    def restaurant_pizza_params
      params.require(:restaurant_pizza).permit(:price, :pizza_id, :restaurant_id)
    end
end
