class PizzasController < ApplicationController
  # Retrieve all Pizzas and return their ID, name, and ingredients
  def index
      pizzas = Pizza.all
      render json: pizzas, only: [:id, :name, :ingredients]
  end
end
