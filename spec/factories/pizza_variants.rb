FactoryBot.define do
  factory :pizza_variant do
    pizza
    size { ["Regular", "Medium", "Large"].sample }
    price { Faker::Commerce.price(range: 100..500) }
  end
end
