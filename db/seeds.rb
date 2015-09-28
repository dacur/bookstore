# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
dates = ["2015-09-15", "2015-09-20", "2015-09-25"]
price = [2500, 1900, 2300, 1000, 750]
purchased = [0,1,2,3,4,5,6,7]

100.times { Book.create({title: "Hello World", author: "Ian Donovan", 
  published_date: dates.sample, price_cents: price.sample, 
  price_currency: "USD", times_purchased: purchased.sample})}

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

