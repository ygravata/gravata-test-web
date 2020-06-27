# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'ygravata@gmail.com', password: "testtest")

PartialSale.create!(user_id: 1)

5.times do
    Sale.create!(
        purchase_name: "João Silva",
        item_description: "R$10 off R$20 of food",
        item_price: 10.0,
        purchase_count: 2,
        merchant_address: "987 Fake St",
        merchant_name: "Bob's, Pizza",
        partial_sale_id: 1
    ) 
end