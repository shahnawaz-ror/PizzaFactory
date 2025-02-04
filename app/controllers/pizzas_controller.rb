class PizzasController < ApplicationController
  def index
    category = params[:category]
    # Find pizzas by the category name provided
    @pizzas = Pizza.joins(:category).where(categories: { name: category })
    # Include price in the JSON response
    render json: @pizzas.map { |pizza| { id: pizza.id, name: pizza.name, price: pizza.price } }
  end
end
