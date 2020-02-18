# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "reset seed database"
User.destroy_all
Plant.destroy_all
Booking.destroy_all
Review.destroy_all

p "generate new seed"
julien = User.new(email: "julien-du-93@gmail.com",
  password: 123456)
julien.save!

antoine = User.new(email: "antoine-du-93@gmail.com",
  password: 567890)
antoine.save!


begonia = Plant.new(name: "beau begonia",
                    price: 10,
                    disponibility: true,
                    species: "maman")
begonia.user = julien
begonia.save!

tulipe = Plant.new(name: "beau tulipe",
                    price: 10,
                    disponibility: true,
                    species: "maman")
tulipe.user = antoine
tulipe.save!

rose = Plant.new(name: "beau rose",
                    price: 10,
                    disponibility: true,
                    species: "maman")
rose.user = antoine
rose.save!

booking1 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 5)
booking1.user = antoine
booking1.plant = begonia
booking1.save!

booking2 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking2.user = julien
booking2.plant = tulipe
booking2.save!

review1 = Review.new(rating: 5, comments: "good")
review1.booking = booking1
review1.save!

review2 = Review.new(rating: 1, comments: "bad")
review2.booking = booking2
review2.save!
