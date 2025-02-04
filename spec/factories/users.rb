FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    role { :vendor } # or :admin for admin users

    trait :admin do
      role { :admin }
    end

    trait :vendor do
      role { :vendor }
    end
  end
end
