# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Require pour photo
require "open-uri"

# --------------------------------------------------------------------------------------
# RESET
# --------------------------------------------------------------------------------------


p "reset seed database"
Review.destroy_all
Booking.destroy_all
Plant.destroy_all
User.destroy_all

# --------------------------------------------------------------------------------------
# USERS
# --------------------------------------------------------------------------------------

p "generate new users"
julien = User.new(email: "julien-du-93@gmail.com",
  password: "123456")
julien.save!

p "julien created"

antoine = User.new(email: "antoine-du-93@gmail.com", password: "567890")
antoine.save!

p "antoine created"

p laurent = User.new(email: "laurent@gmail.com", password: "123456")
laurent.save!

p "laurent created"

# --------------------------------------------------------------------------------------
# IMAGES
# --------------------------------------------------------------------------------------


p "save images"

begonia_file = URI.open('https://www.queenflowerbulbs.fr/media/product/187/bulbes-begonia-begonia-bertinii-c25.jpg')
tulipe_file = URI.open('https://media.ooreka.fr/public/image/plant/80/mainImage-source-9412304.jpg')
rose_file = URI.open('https://www.jacksonandperkins.com/images/xxl/v1780.jpg')
ficus_file = URI.open('https://www.jardinpourvous.com/media/catalog/product/cache/13/image/500x/9df78eab33525d08d6e5fb8d27136e95/F/D/FD19307WH_13.jpg')
sapin_file = URI.open('https://photos.gammvert.fr/v5/products/full/50697-sapin-de-noel-artificiel-vert-tsuga-h215xd137cm-2.jpg')
lierre_file = URI.open('https://www.artificielles.com/Files/24827/Img/23/12372-80430-Lierre-artificiel-Hedera-Helix-en-chute-80-cm-artificielles-com-.jpg')
geranium_file = URI.open('https://www.jardiner-malin.fr/wp-content/uploads/2018/10/geranium.jpg')


# --------------------------------------------------------------------------------------
# PLANTS
# --------------------------------------------------------------------------------------


p "generate seed plants"
begonia = Plant.new(name: "Begonia",
                    price: 10,
                    comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    address: "16 Villa Gaudelet Paris",
                    disponibility_start: DateTime.new(2020,5,1),
                    disponibility_end: DateTime.new(2020,8,4),
                    species: "Begonia scharffii",
                    size: "M",
                    weight: "7kg",
                    indoor_outdoor: "Outdoor")
begonia.user = julien
begonia.photo.attach(io: begonia_file, filename: 'begonia.jpg', content_type: 'image/jpg')
begonia.save!

p "begonia created"

p tulipe = Plant.new(name: "Tulipe",
                    price: 10,
                    comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    address: "10 rue des batignolles Paris",
                    disponibility_start: DateTime.new(2020,3,6),
                    disponibility_end: DateTime.new(2020,5,7),
                    species: "Tulipa clusiana ",
                    size: "S",
                    weight: "3kg",
                    indoor_outdoor: "Outdoor")
p "tulipe new"
tulipe.photo.attach(io: tulipe_file, filename: 'tulipe.jpg', content_type: 'image/jpg')
p "tulipe photo saved"
p tulipe.user = laurent
p "laurent saved to tulipe"
tulipe.save!

p "tulipe created"

rose = Plant.new(name: "Roses rouges",
                    price: 10,
                    comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    disponibility_start: DateTime.new(2020,4,9),
                    disponibility_end: DateTime.new(2020,5,3),
                    address: "7 avenue des champs elysées, paris",
                    species: "Rosebud",
                    size: "S",
                    weight: "1kg",
                    indoor_outdoor: "Outdoor")
rose.user = antoine
rose.photo.attach(io: rose_file, filename: 'rose.jpg', content_type: 'image/jpg')
rose.save!

p "rose created"

ficus = Plant.new(name: "Ficus coréen",
                    price: 10,
                    comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    disponibility_start: DateTime.new(2020,6,3),
                    disponibility_end: DateTime.new(2020,9,12),
                    species: "Ficus benghalensis",
                    address: "25 rue de l'université, Paris",
                    size: "M",
                    weight: "10kg",
                    indoor_outdoor: "Indoor")
ficus.user = antoine
ficus.photo.attach(io: ficus_file, filename: 'rose.jpg', content_type: 'image/jpg')
ficus.save!

p "ficus created"

sapin = Plant.new(name: "Sapin",
                    price: 10,
                    comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    disponibility_start: DateTime.new(2020,12,11),
                    disponibility_end: DateTime.new(2021,8,4),
                    species: "Norman",
                    address: "porte de la Villette, Paris",
                    size: "L",
                    weight: "30kg",
                    indoor_outdoor: "Outdoor")
sapin.user = antoine
sapin.photo.attach(io: sapin_file, filename: 'tulipe.jpg', content_type: 'image/jpg')
sapin.save!

p "sapin created"

lierre = Plant.new(name: "Lierre",
                    price: 10,
                    comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    disponibility_start: DateTime.new(2020,4,7),
                    disponibility_end: DateTime.new(2020,8,5),
                    species: "Lierre hongrois",
                    address: "129 rue de l'Abbé Groult, Paris",
                    size: "M",
                    weight: "10kg",
                    indoor_outdoor: "Outdoor")
lierre.user = antoine
lierre.photo.attach(io: lierre_file, filename: 'lierre.jpg', content_type: 'image/jpg')
lierre.save!

p "lierre created"

geranium = Plant.new(name: "Geranium",
                    price: 10,
                    comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    disponibility_start: DateTime.new(2020,4,7),
                    disponibility_end: DateTime.new(2020,8,5),
                    species: "Géranium fabulum",
                    address: "1 rue du Commerce, Paris",
                    size: "S",
                    weight: "3kg",
                    indoor_outdoor: "Outdoor")
geranium.user = antoine
geranium.photo.attach(io: geranium_file, filename: 'geranium.jpg', content_type: 'image/jpg')
geranium.save!

p "geranium created"

# --------------------------------------------------------------------------------------
# BOOKINGS
# --------------------------------------------------------------------------------------


p "generate seed bookings"
booking_geranium = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 5)
booking_geranium.user = antoine
booking_geranium.plant = geranium
booking_geranium.save!

p "booking_geranium created"

booking_begonia = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking_begonia.user = julien
booking_begonia.plant = begonia
booking_begonia.save!

p "booking_begonia created"

booking_rose = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking_rose.user = laurent
booking_rose.plant = rose
booking_rose.save!

p "booking_rose created"


booking_tulipe1 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking_tulipe1.user = laurent
booking_tulipe1.plant = tulipe
booking_tulipe1.save!

p "booking_tulipe1 created"

booking_tulipe2 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking_tulipe2.user = laurent
booking_tulipe2.plant = tulipe
booking_tulipe2.save!

p "booking_tulipe2 created"

booking_tulipe3 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking_tulipe3.user = antoine
booking_tulipe3.plant = tulipe
booking_tulipe3.save!

p "booking_tulipe3 created"


# --------------------------------------------------------------------------------------
# REVIEWS
# --------------------------------------------------------------------------------------

p "generate seed reviews"
review1_booking_begonia = Review.new(rating: 5, comments: "Very nice begonias, it all went fine!")
review1_booking_begonia.booking = booking_begonia
review1_booking_begonia.save!

p "review1_booking_begonia created"

review2_booking_begonia = Review.new(rating: 3, comments: "Nice plants")
review2_booking_begonia.booking = booking_begonia
review2_booking_begonia.save!

p "review2_booking_begonia created"


review1_booking_tulipe1 = Review.new(rating: 1, comments: "Owner didn't come to meeting point")
review1_booking_tulipe1.booking = booking_tulipe1
review1_booking_tulipe1.save!

p "review1_booking_tulipe1 created"

review2_booking_tulipe = Review.new(rating: 3, comments: "Nice flowers but owner hard to reach")
review2_booking_tulipe.booking = booking_tulipe2
review2_booking_tulipe.save!

p "review2_booking_tulipe created"

review3_booking_tulipe = Review.new(rating: 4, comments: "Very nice tulipes, thank you!")
review3_booking_tulipe.booking = booking_tulipe3
review3_booking_tulipe.save!

p "review3_booking_tulipe created"
