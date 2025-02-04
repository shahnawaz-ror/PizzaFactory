FactoryBot.define do
  factory :inventory do
    item_type { ["PizzaVariant", "Topping", "Side"].sample }
    item_id { [PizzaVariant, Topping, Side].sample.id }
    quantity { Faker::Number.between(from: 10, to: 100) }
  end
end
