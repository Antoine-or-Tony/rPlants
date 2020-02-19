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
User.destroy_all
Plant.destroy_all
Booking.destroy_all
Review.destroy_all

p "generate new users"
julien = User.new(email: "julien-du-93@gmail.com",
  password: 123456)
julien.save!

p "julien created"

antoine = User.new(email: "antoine-du-93@gmail.com",
  password: 567890)
antoine.save!

p "antoine created"

laurent = User.new(email: "laurent@gmail.com", password: 123456)
laurent.save!

p "laurent created"


p "save images"

begonia_file = URI.open('https://www.queenflowerbulbs.fr/media/product/187/bulbes-begonia-begonia-bertinii-c25.jpg')
tulipe_file = URI.open('https://media.ooreka.fr/public/image/plant/80/mainImage-source-9412304.jpg')
rose_file = URI.open('https://www.jacksonandperkins.com/images/xxl/v1780.jpg')
ficus_file = URI.open('https://www.jardinpourvous.com/media/catalog/product/cache/13/image/500x/9df78eab33525d08d6e5fb8d27136e95/F/D/FD19307WH_13.jpg')

p "generate seed plants"
begonia = Plant.new(name: "Mon beau begonia",
                    price: 10,
                    disponibility_start: DateTime.new(2020,5,1),
                    disponibility_end: DateTime.new(2020,8,4),
                    species: "begonia")
begonia.user = julien
begonia.photo.attach(io: begonia_file, filename: 'begonia.jpg', content_type: 'image/jpg')
begonia.save!

p "begonia created"

tulipe = Plant.new(name: "Tulipe",
                    price: 10,
                    disponibility_start: DateTime.new(2020,3,6),
                    disponibility_end: DateTime.new(2020,5,7),
                    species: "gros bulbe")
p "tulipe new"
tulipe.photo.attach(io: tulipe_file, filename: 'tulipe.jpg', content_type: 'image/jpg')
p "tulipe photo saved"
tulipe.user = julien
p "laurent saved to tulipe"
tulipe.save!

p "tulipe created"

rose = Plant.new(name: "Rose",
                    price: 10,
                    disponibility_start: DateTime.new(2020,4,9),
                    disponibility_end: DateTime.new(2020,5,3),
                    species: "Rosebud")
rose.user = antoine
rose.photo.attach(io: rose_file, filename: 'rose.jpg', content_type: 'image/jpg')
rose.save!

p "rose created"

ficus = Plant.new(name: "Mon beau ficus",
                    price: 10,
                    disponibility_start: DateTime.new(2020,6,3),
                    disponibility_end: DateTime.new(2020,9,12),
                    species: "ficus")
ficus.user = laurent
ficus.photo.attach(io: ficus_file, filename: 'rose.jpg', content_type: 'image/jpg')
ficus.save!

p "ficus created"

sapin = Plant.new(name: "sapin",
                    price: 10,
                    disponibility_start: DateTime.new(2020,12,11),
                    disponibility_end: DateTime.new(2021,8,4),
                    species: "gros bulbe")
sapin.user = antoine
sapin.photo.attach(io: tulipe_file, filename: 'tulipe.jpg', content_type: 'image/jpg')
sapin.save!

p "sapin created"

lierre = Plant.new(name: "lierre",
                    price: 10,
                    disponibility_start: DateTime.new(2020,4,7),
                    disponibility_end: DateTime.new(2020,8,5),
                    species: "lierrebud")
lierre.user = antoine
lierre.photo.attach(io: rose_file, filename: 'rose.jpg', content_type: 'image/jpg')
lierre.save!

p "lierre created"

p "generate seed bookings"
booking1 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 5)
booking1.user = antoine
booking1.plant = begonia
booking1.save!

p "booking1 created"

booking2 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking2.user = julien
booking2.plant = begoni
booking2.save!

p "booking2 created"

booking3 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking3.user = laurent
booking3.plant = lierre
booking3.save!

p "generate seed reviews"
review1 = Review.new(rating: 5, comments: "good")
review1.booking = booking1
review1.save!

p "review1 created"

review2 = Review.new(rating: 1, comments: "bad")
review2.booking = booking2
review2.save!

p "review2 created"
