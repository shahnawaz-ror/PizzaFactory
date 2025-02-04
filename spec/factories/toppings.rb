FactoryBot.define do
  factory :topping do
    name { Faker::Food.ingredient }
    price { Faker::Commerce.price(range: 10..50) }
    vegetarian { [true, false].sample }
  end
end
