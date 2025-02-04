FactoryBot.define do
  factory :pizza do
    name { Faker::Food.dish }
    category
  end
end
