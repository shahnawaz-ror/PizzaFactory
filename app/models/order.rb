class Order < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :pizza
  belongs_to :pizza_variant
  belongs_to :crust
  has_and_belongs_to_many :toppings
  has_and_belongs_to_many :sides

  # Remove the before_save callback and use an after_save callback instead.
  after_save :update_total_price

  def update_total_price
    # Calculate the total based on the saved associations.
    variant_price = pizza_variant&.price.to_f
    toppings_price = toppings.sum(:price).to_f
    sides_price = sides.sum(:price).to_f
    extra_cheese_charge = extra_cheese ? 35 : 0

    total = variant_price + toppings_price + sides_price + extra_cheese_charge

    # Update the total_price column without triggering additional callbacks.
    update_column(:total_price, total)
  end
end
