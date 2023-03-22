class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    def index
      restaurants = Restaurant.all
      render json: restaurants, only: [:id, :name, :address]
    end
    def show
      restaurant = find_restaurant
    
      if restaurant
        render json: restaurant, only: [:id, :name, :address], include: { pizzas: { only: [:id, :name, :ingredients] } }
      else
        render json: { error: "Restaurant not found" }, status: :not_found
      end
    end
    
  
    def destroy
      restaurant = Restaurant.find(params[:id])
      restaurant.destroy
    end
  
    private
  
    def find_restaurant
      Restaurant.find_by(id: params[:id])
    end
  
    def render_not_found_response
      render json: { error: "Restaurant not found" }, status: :not_found
    end
end
