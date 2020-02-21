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
                  password: "123456",
                  first_name: "Julien",
                  last_name: "Dupuis",
                  bio: "I love begonias!")
julien.save!

p "julien created"

antoine = User.new(email: "antoine-du-93@gmail.com",
                  password: "567890",
                   first_name: "Antoine",
                  last_name: "Durand",
                  bio: "I have amazing roses to share :)")
antoine.save!

p "antoine created"

p laurent = User.new(email: "laurent@gmail.com",
                    password: "123456",
                    first_name: "Laurent",
                    last_name: "Martin",
                    bio: "A real plant lover!")
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
sapin_file = URI.open('http://4.bp.blogspot.com/-7vIIL3fALU4/UMczMO-etLI/AAAAAAAA9I8/hakIlezSJcY/s1600/Christmas-Lighting-for-your-front-porch-christmas-decoration10.jpg')
lierre_file = URI.open('https://assets.bakker.com/ProductPics/810x978/71916-00-BAKIE_20190222052326.jpg')
geranium_file = URI.open('https://www.jardiner-malin.fr/wp-content/uploads/2018/10/geranium.jpg')


# --------------------------------------------------------------------------------------
# PLANTS
# --------------------------------------------------------------------------------------


p "generate seed plants"
begonia = Plant.new(name: "Begonia",
                    price: 10,
                    comments: "Typically used as houseplants and in shaded summer beds. Some are grown for their asymmetrical, patterned and variegated foliage, and others to add color to shady garden areas with their bright blooms.",
                    address: "3 B Chemin de la Mer, 76310 Sainte-Adresse, Le Havre, France",
                    disponibility_start: DateTime.new(2020,5,1),
                    disponibility_end: DateTime.new(2020,8,4),
                    species: "Begonia scharffii",
                    size: "Medium",
                    weight: "Light (0-2kg)",
                    indoor_outdoor: "Indoor/Outdoor")
begonia.user = laurent
begonia.photo.attach(io: begonia_file, filename: 'begonia.jpg', content_type: 'image/jpg')
begonia.save!

p "begonia created"

p tulipe = Plant.new(name: "Tulipes",
                    price: 10,
                    comments: "An unusual member of the iris family, snake’s head iris has striking yellow-green standards and velvety, nearly black falls that have a high-fashion cocktail-dress allure.",
                    address: "10 rue des batignolles Paris",
                    disponibility_start: DateTime.new(2020,3,6),
                    disponibility_end: DateTime.new(2020,5,7),
                    species: "Tulipa clusiana ",
                    size: "Small",
                    weight: "Light (0-2kg)",
                    indoor_outdoor: "Outdoor")
p "tulipe new"
tulipe.photo.attach(io: tulipe_file, filename: 'tulipe.jpg', content_type: 'image/jpg')
p "tulipe photo saved"
p tulipe.user = laurent
p "laurent saved to tulipe"
tulipe.save!

p "tulipe created"

rose = Plant.new(name: "Roses",
                    price: 10,
                    comments: "15 white and red flowers, typically last 2 weeks.",
                    disponibility_start: DateTime.new(2020,4,9),
                    disponibility_end: DateTime.new(2020,5,3),
                    address: "7 avenue des champs elysées, paris",
                    species: "Rosebud",
                    size: "Small",
                    weight: "Light (0-2kg)",
                    indoor_outdoor: "Outdoor")
rose.user = antoine
rose.photo.attach(io: rose_file, filename: 'rose.jpg', content_type: 'image/jpg')
rose.save!

p "rose created"

ficus = Plant.new(name: "Korean Ficus",
                    price: 10,
                    comments: "A nice small tree with glossy deep green leaves with white along the edges on short drooping branches. 1m high, perfect for your living room!",
                    disponibility_start: DateTime.new(2020,6,3),
                    disponibility_end: DateTime.new(2020,9,12),
                    species: "Ficus benghalensis",
                    address: "25 rue de l'université, Paris",
                    size: "Medium",
                    weight: "Heavy (5-10kg)",
                    indoor_outdoor: "Indoor")
ficus.user = antoine
ficus.photo.attach(io: ficus_file, filename: 'rose.jpg', content_type: 'image/jpg')
ficus.save!

p "ficus created"

sapin = Plant.new(name: "Fir",
                    price: 10,
                    comments: "A large evergreen coniferous tree. 2m high, perfect for Christmas!",
                    disponibility_start: DateTime.new(2020,12,11),
                    disponibility_end: DateTime.new(2021,8,4),
                    species: "Nordman",
                    address: "porte de la Villette, Paris",
                    size: "Large",
                    weight: "Extra heavy (>10kg)",
                    indoor_outdoor: "Outdoor")
sapin.user = julien
sapin.photo.attach(io: sapin_file, filename: 'tulipe.jpg', content_type: 'image/jpg')
sapin.save!

p "sapin created"

lierre = Plant.new(name: "Ivy",
                    price: 10,
                    comments: "1m high evergreen climbing or ground-creeping woody plants, native to central Europe.",
                    disponibility_start: DateTime.new(2020,4,7),
                    disponibility_end: DateTime.new(2020,8,5),
                    species: "Hungarian ivy",
                    address: "129 rue de l'Abbé Groult, Paris",
                    size: "Medium",
                    weight: "Medium (2-5kg)",
                    indoor_outdoor: "Outdoor")
lierre.user = julien
lierre.photo.attach(io: lierre_file, filename: 'lierre.jpg', content_type: 'image/jpg')
lierre.save!

p "lierre created"

geranium = Plant.new(name: "Geranium",
                    price: 10,
                    comments: "The flowers have five petals and are coloured white, pink, purple and blue",
                    disponibility_start: DateTime.new(2020,4,7),
                    disponibility_end: DateTime.new(2020,8,5),
                    species: "Géranium fabulum",
                    address: "1 rue du Commerce, Paris",
                    size: "Small",
                    weight: "Light (0-2kg)",
                    indoor_outdoor: "Outdoor")
geranium.user = antoine
geranium.photo.attach(io: geranium_file, filename: 'geranium.jpg', content_type: 'image/jpg')
geranium.save!

p "geranium created"

# --------------------------------------------------------------------------------------
# BOOKINGS
# --------------------------------------------------------------------------------------


p "generate seed bookings"
booking_geranium1 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 5)
booking_geranium1.user = antoine
booking_geranium1.plant = geranium
booking_geranium1.save!

p "booking_geranium1 created"

booking_begonia1 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking_begonia1.user = julien
booking_begonia1.plant = begonia
booking_begonia1.save!

p "booking_begonia1 created"


booking_begonia2 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking_begonia2.user = julien
booking_begonia2.plant = begonia
booking_begonia2.save!

p "booking_begonia2 created"

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
booking_tulipe1.user = julien
booking_tulipe1.plant = tulipe
booking_tulipe1.save!

p "booking_tulipe1 created"

booking_tulipe2 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking_tulipe2.user = julien
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
review1_booking_geranium1 = Review.new(rating: 5, comments: "Very nice geraniums, it all went fine!")
review1_booking_geranium1.booking = booking_geranium1
review1_booking_geranium1.save!

p "review1_booking_begonia1 created"

review1_booking_begonia2 = Review.new(rating: 4, comments: "Nice plants")
review1_booking_begonia2.booking = booking_begonia2
review1_booking_begonia2.save!

p "review1_booking_begonia2 created"


review1_booking_tulipe1 = Review.new(rating: 1, comments: "Owner didn't come to meeting point")
review1_booking_tulipe1.booking = booking_tulipe1
review1_booking_tulipe1.save!

p "review1_booking_tulipe1 created"

review1_booking_tulipe2 = Review.new(rating: 3, comments: "Nice flowers but owner hard to reach")
review1_booking_tulipe2.booking = booking_tulipe2
review1_booking_tulipe2.save!

p "review1_booking_tulipe2 created"

review1_booking_tulipe3 = Review.new(rating: 4, comments: "Very nice tulipes, thank you!")
review1_booking_tulipe3.booking = booking_tulipe3
review1_booking_tulipe3.save!

p "review3_booking_tulipe created"
