# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times { Book.create({title: "Hello World", author: "Ian Donovan", 
  published_date: "2015-09-15", price_cents: 2500, price_currency: "USD"})}