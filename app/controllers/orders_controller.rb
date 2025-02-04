class OrdersController < ApplicationController
  before_action :authenticate_user!

  def home
    @vegetarian_pizzas = Pizza.joins(:category).where(categories: { name: "Vegetarian" })
    @non_vegetarian_pizzas = Pizza.joins(:category).where(categories: { name: "Non-Vegetarian" })
    @crusts = Crust.all
    @veg_toppings = Topping.where(vegetarian: true)
    @non_veg_toppings = Topping.where(vegetarian: false)
    @extra_cheese = Topping.find_by(name: "Extra Cheese")
    @sides = Side.all
  end

  def index
    @orders = current_user.orders.includes(:order_items)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new(order_params)

    if @order.save
      redirect_to @order, notice: "Order placed successfully!"
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:category_id, :pizza_id, :pizza_variant_id, :crust_id, :extra_cheese, :total_price, topping_ids: [], side_ids: [])
  end
end
