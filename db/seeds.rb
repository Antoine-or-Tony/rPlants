# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Require pour photo
require "open-uri"

p "reset seed database"
Plant.destroy_all
Booking.destroy_all
Review.destroy_all
User.destroy_all

p "generate new users"
julien = User.new(email: "julien-du-93@gmail.com",
  password: 123456)
julien.save!

antoine = User.new(email: "antoine-du-93@gmail.com",
  password: 567890)
antoine.save!

p "save images"

begonia_file = URI.open('https://www.queenflowerbulbs.fr/media/product/187/bulbes-begonia-begonia-bertinii-c25.jpg')
tulipe_file = URI.open('https://media.ooreka.fr/public/image/plant/80/mainImage-source-9412304.jpg')
rose_file = URI.open('https://www.jacksonandperkins.com/images/xxl/v1780.jpg')


p "generate seed plants"
begonia = Plant.new(name: "Mon beau begonia",
                    price: 10,
                    disponibility: true,
                    species: "begonia")
begonia.user = julien
begonia.photo.attach(io: begonia_file, filename: 'begonia.jpg', content_type: 'image/jpg')
begonia.save!

tulipe = Plant.new(name: "Tulipe",
                    price: 10,
                    disponibility: true,
                    species: "gros bulbe")
tulipe.user = antoine
tulipe.photo.attach(io: tulipe_file, filename: 'tulipe.jpg', content_type: 'image/jpg')
tulipe.save!

rose = Plant.new(name: "Rose",
                    price: 10,
                    disponibility: true,
                    species: "Rosebud")
rose.user = antoine
rose.photo.attach(io: rose_file, filename: 'rose.jpg', content_type: 'image/jpg')
rose.save!

ficus = Plant.new(name: "Mon beau ficus",
                    price: 10,
                    disponibility: true,
                    species: "ficus")
ficus.user = julien
ficus.photo.attach(io: rose_file, filename: 'rose.jpg', content_type: 'image/jpg')
ficus.save!

sapin = Plant.new(name: "sapin",
                    price: 10,
                    disponibility: true,
                    species: "gros bulbe")
sapin.user = antoine
sapin.photo.attach(io: tulipe_file, filename: 'tulipe.jpg', content_type: 'image/jpg')
sapin.save!

lierre = Plant.new(name: "lierre",
                    price: 10,
                    disponibility: true,
                    species: "lierrebud")
lierre.user = antoine
lierre.photo.attach(io: rose_file, filename: 'rose.jpg', content_type: 'image/jpg')
lierre.save!

p "generate seed bookings"
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


p "generate seed reviews"
review1 = Review.new(rating: 5, comments: "good")
review1.booking = booking1
review1.save!

review2 = Review.new(rating: 1, comments: "bad")
review2.booking = booking2
review2.save!
