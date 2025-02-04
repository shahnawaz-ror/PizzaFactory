FactoryBot.define do
  factory :side do
    name { ["Cold drink", "Mousse cake"].sample }
    price { Faker::Commerce.price(range: 50..100) }
  end
end
