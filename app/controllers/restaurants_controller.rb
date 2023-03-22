class RestaurantsController < ApplicationController
  # handle RecordNotFound exception and render appropriate response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    # fetch all restaurants from database
    restaurants = Restaurant.all
    # render the list of restaurants as json response
    render json: restaurants, only: [:id, :name, :address]
  end
  
  def show
    # find the restaurant by id, if it exists
    restaurant = find_restaurant
  
    if restaurant
      # render the restaurant details with its pizzas as json response
      render json: restaurant, only: [:id, :name, :address], include: { pizzas: { only: [:id, :name, :ingredients] } }
    else
      # if restaurant not found, render error message as json response
      render json: { error: "Restaurant not found" }, status: :not_found
    end
  end
  
  def destroy
    # find the restaurant by id
    restaurant = Restaurant.find(params[:id])
    # delete the restaurant
    restaurant.destroy
  end

  private

  # method to find restaurant by id
  def find_restaurant
    Restaurant.find_by(id: params[:id])
  end

  # method to render error response for not found
  def render_not_found_response
    render json: { error: "Restaurant not found" }, status: :not_found
  end
end
