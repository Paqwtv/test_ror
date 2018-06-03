FactoryBot.define do
  factory :product do
    name { Faker::Pokemon.name }
    price { Faker::Number.decimal(2) }
  end
end
