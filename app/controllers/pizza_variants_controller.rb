class PizzaVariantsController < ApplicationController
  def index
    @variants = PizzaVariant.where(pizza_id: params[:pizza_id])
    # Return size and price for each variant
    render json: @variants.as_json(only: [:id, :size, :price])
  end
end
