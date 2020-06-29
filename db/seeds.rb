# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts 'Cleaning database...'

CompanyPartialSale.destroy_all
Sale.destroy_all
User.destroy_all

puts "Creating a user"
new_user = User.create!(email: 'ygravata@gmail.com', password: "testtest", first_name: "Yuri")
puts "User created!"


company_seed = CompanyPartialSale.create!(user_id: new_user.id)


new_sale = Sale.create!(
    purchase_name: "João Silva",
    item_description: "R$10 off R$20 of food",
    item_price: 10.0,
    purchase_count: 2,
    merchant_address: "987 Fake St",
    merchant_name: "Bob's, Pizza",
    company_partial_sale_id: company_seed.id
)

puts "Sale #{new_sale.id} created" 

new_sale = Sale.create!(
    purchase_name: "Amy Pond",
    item_description: "R$30 of awesome for R$10",
    item_price: 10.0,
    purchase_count: 5,
    merchant_address: "456 Unreal Rd",
    merchant_name: "Tom's Awesome Shop",
    company_partial_sale_id: company_seed.id
)

puts "Sale #{new_sale.id} created" 

new_sale = Sale.create!(
    purchase_name: "Marty McFly",
    item_description: "R$20 Sneakers for R$5",
    item_price: 5.0,
    purchase_count: 1,
    merchant_address: "123 Fake St",
    merchant_name: "Tom's Awesome Shop",
    company_partial_sale_id: company_seed.id
)

puts "Sale #{new_sale.id} created" 

new_sale = Sale.create!(
    purchase_name: "Snake Plissken",
    item_description: "R$20 Sneakers for R$5",
    item_price: 5.0,
    purchase_count: 4,
    merchant_address: "123 Fake St",
    merchant_name: "Tom's Awesome Shop",
    company_partial_sale_id: company_seed.id
)

puts "Sale #{new_sale.id} created" 
