class ToppingsController < ApplicationController
  def index
    if params[:category].present?
      @toppings = if params[:category] == 'Vegetarian'
                    Topping.where(vegetarian: true)
                  else
                    Topping.where.not(name: "Paneer") # Exclude Paneer for Non-Vegetarian
                  end
    else
      @toppings = Topping.all
    end

    # Render only the attributes needed by your JavaScript (name and price, plus id)
    render json: @toppings.as_json(only: [:id, :name, :price])
  end
end
