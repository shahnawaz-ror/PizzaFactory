require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { User.create!(email: "test@example.com", password: "password") }
  let(:category) { Category.create!(name: "Pizza") }
  let(:pizza) { Pizza.create!(name: "Margherita", category: category) }
  let(:pizza_variant) { PizzaVariant.create!(size: "Large", price: 300, pizza: pizza) }
  let(:crust) { Crust.create!(name: "Thin Crust") }
  let(:topping1) { Topping.create!(name: "Olives", price: 50) }
  let(:topping2) { Topping.create!(name: "Mushrooms", price: 40) }
  let(:side1) { Side.create!(name: "Garlic Bread", price: 100) }
  let(:side2) { Side.create!(name: "Soft Drink", price: 50) }

  it "calculates total_price correctly" do
    pizza_variant # Ensure it exists before order is created

    order = Order.create!(
      user: user,
      category: category,
      pizza: pizza,
      pizza_variant: pizza_variant,
      crust: crust,
      extra_cheese: true
    )

    order.toppings << [topping1, topping2]
    order.sides << [side1, side2]
    order.save!

    expected_total = 300 + 50 + 40 + 100 + 50 + 35 # variant + toppings + sides + extra cheese
    expect(order.total_price).to eq(expected_total)
  end
end
