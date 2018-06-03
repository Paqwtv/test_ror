# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Product.destroy_all

10.times do
  Category.create(name: Faker::Food.fruits)
end

1000.times do
  Product.create(category_id: (Category.all.pluck(:id).sample),
                 name: Faker::Pokemon.name,
                 price: Faker::Number.decimal(2))
end
