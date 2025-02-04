# spec/factories/orders.rb
FactoryBot.define do
  factory :order do
    user
    association :category
    association :pizza
    association :crust
    association :pizza_variant
    extra_cheese { false }
    total_price { 100.0 }

    transient do
      toppings_count { 1 }
      sides_count { 1 }
    end

    after(:build) do |order, evaluator|
      order.toppings << build_list(:topping, evaluator.toppings_count)
      order.sides << build_list(:side, evaluator.sides_count)
    end
  end
end