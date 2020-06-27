# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'

CompanyPartialSale.destroy_all
Sale.destroy_all
User.destroy_all

puts "Creating a user"
new_user = User.create!(email: 'ygravata@gmail.com', password: "testtest")
puts "User created!"


company_seed = CompanyPartialSale.create!(user_id: new_user.id)


5.times do
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
end