FactoryBot.define do
  factory :crust do
    name { ["New hand tossed", "Wheat thin crust", "Cheese Burst", "Fresh pan pizza"].sample }
    price { 0 }
  end
end
