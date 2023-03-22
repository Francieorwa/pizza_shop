class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: restaurant_pizza.pizza, only: [:id, :name, :ingredients]
      rescue ActiveRecord::RecordInvalid
        render json: { errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
      end
    
      private
    
      def restaurant_pizza_params
        params.require(:restaurant_pizza).permit(:price, :pizza_id, :restaurant_id)
      end
end
