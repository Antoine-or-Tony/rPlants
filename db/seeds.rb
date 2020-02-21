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
# IMAGES USERS
# --------------------------------------------------------------------------------------

p "save images avatar"

avatar_julien_file = URI.open('https://www.aquinum.fr/images/comprofiler/632_5bf032441a375.jpg')
avatar_antoine_file = URI.open('https://3wpie932p5cn1pgjba40gtkbm83-wpengine.netdna-ssl.com/wp-content/uploads/2018/10/Julien-Lachance.jpg')
avatar_laurent_file = URI.open('http://www.agenceartistique.com/DATA/PHOTO/359_grande.jpg')

# --------------------------------------------------------------------------------------
# USERS
# --------------------------------------------------------------------------------------

p "generate new users"
julien = User.new(email: "julien-du-93@gmail.com",
                  password: "123456",
                  first_name: "Julien",
                  last_name: "Dupuis",
                  bio: "I love begonias!")
julien.photo.attach(io: avatar_julien_file, filename: 'review_julien.jpg', content_type: 'image/jpg')
julien.save!

p "julien created"

antoine = User.new(email: "antoine-du-93@gmail.com",
                  password: "567890",
                   first_name: "Antoine",
                  last_name: "Durand",
                  bio: "I have amazing roses to share :)")
antoine.photo.attach(io: avatar_antoine_file, filename: 'review_antoine.jpg', content_type: 'image/jpg')
antoine.save!

p "antoine created"

p laurent = User.new(email: "laurent@gmail.com",
                    password: "123456",
                    first_name: "Laurent",
                    last_name: "Martin",
                    bio: "A real plant lover!")
laurent.photo.attach(io: avatar_laurent_file, filename: 'review_laurent.jpg', content_type: 'image/jpg')
laurent.save!

p "laurent created"

manu = User.new(email: "manu@ciao.fr",
                    password: "123456",
                    first_name: "Manu",
                    last_name: "Ciao",
                    bio: "A real plant lover!")

# --------------------------------------------------------------------------------------
# IMAGES PLANTS
# --------------------------------------------------------------------------------------


p "save plants images"

tulipe_file = URI.open('https://media.ooreka.fr/public/image/plant/80/mainImage-source-9412304.jpg')
rose_file = URI.open('https://www.jacksonandperkins.com/images/xxl/v1780.jpg')
ficus_file = URI.open('https://www.jardinpourvous.com/media/catalog/product/cache/13/image/500x/9df78eab33525d08d6e5fb8d27136e95/F/D/FD19307WH_13.jpg')
sapin_file = URI.open('http://4.bp.blogspot.com/-7vIIL3fALU4/UMczMO-etLI/AAAAAAAA9I8/hakIlezSJcY/s1600/Christmas-Lighting-for-your-front-porch-christmas-decoration10.jpg')
lierre_file = URI.open('https://assets.bakker.com/ProductPics/810x978/71916-00-BAKIE_20190222052326.jpg')
geranium_file = URI.open('https://www.jardiner-malin.fr/wp-content/uploads/2018/10/geranium.jpg')
cactus_file = URI.open('https://i.pinimg.com/originals/d4/67/96/d46796908df78cd9e243430ba6f460b7.jpg')
senecio_file = URI.open('https://blog.damasketdentelle.com/wp-content/uploads/e3a1d62f5370bda3e38506d3a9cf8306.jpg')
oak_file = URI.open('https://www.jardinsdefrance.org/wp-content/uploads/jdf-medias/images/JdF634/Chene%20Kremer%20670.jpeg')
monstera_file = URI.open('https://cdn.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_517,h_592/https://www.lemeubleniobe.fr/wp-content/uploads/2019/09/Monstera-2-e1569420369898.jpg')
pilea_file = URI.open("https://cdn.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_596/https://www.lemeubleniobe.fr/wp-content/uploads/2019/09/Pilea.jpg")

begonia_file = URI.open('https://www.queenflowerbulbs.fr/media/product/187/bulbes-begonia-begonia-bertinii-c25.jpg')
begonia2_file = URI.open('https://s3.amazonaws.com/cdn.gurneys.com/images/800/67890.jpg')
begonia3_file = URI.open('https://media.ooreka.fr/public/image/plant/128/mainImage-full-11364528.jpg')

# --------------------------------------------------------------------------------------
# PLANTS
# --------------------------------------------------------------------------------------

p "generate seed plants"
begonia = Plant.new(name: "Begonia",
                    price: 2,
                    comments: "Typically used as houseplants and in shaded summer beds. Some are grown for their asymmetrical, patterned and variegated foliage, and others to add color to shady garden areas with their bright blooms.",
                    address: "10 rue des Batignolles, Paris, France",
                    disponibility_start: DateTime.new(2020,5,1),
                    disponibility_end: DateTime.new(2020,8,4),
                    species: "Begonia scharffii",
                    size: "Medium",
                    weight: "Light (0-2kg)",
                    indoor_outdoor: "Indoor/Outdoor")
begonia.user = laurent
begonia.photo.attach(io: begonia_file, filename: 'begonia.jpg', content_type: 'image/jpg')
begonia.save!

monstera = Plant.new(name: "Monstera",
                    price: 3,
                    comments: "A very fancy plant, perfect for your living room.",
                    address: "3 rue Jean Mermoz, Versailles, France",
                    disponibility_start: DateTime.new(2020,5,1),
                    disponibility_end: DateTime.new(2020,8,4),
                    species: "Monstera splendida",
                    size: "Medium",
                    weight: "Medium (2-5kg)",
                    indoor_outdoor: "Indoor")
monstera.user = laurent
monstera.photo.attach(io: monstera_file, filename: 'monstera.jpg', content_type: 'image/jpg')
monstera.save!

p "monstera created"

pilea = Plant.new(name: "pilea",
                    price: 3,
                    comments: "A very fancy plant, perfect for your living room.",
                    address: "8 place de la Sorbonne, Paris",
                    disponibility_start: DateTime.new(2020,5,1),
                    disponibility_end: DateTime.new(2020,8,4),
                    species: "pilea splendida",
                    size: "Medium",
                    weight: "Medium (2-5kg)",
                    indoor_outdoor: "Indoor")
pilea.user = antoine
pilea.photo.attach(io: pilea_file, filename: 'pilea.jpg', content_type: 'image/jpg')
pilea.save!

p "pilea created"

p tulipe = Plant.new(name: "Tulipes",
                    price: 2,
                    comments: "An unusual member of the iris family, snake’s head iris has striking yellow-green standards and velvety, nearly black falls that have a high-fashion cocktail-dress allure.",
                    address: "3 B Chemin de la Mer, 76310 Sainte-Adresse, Le Havre, France",
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
                    price: 2,
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
                    price: 5,
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
                    price: 6,
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

begonia2 = Plant.new(name: "My begonias",
                    price: 3,
                    comments: "Typically used as houseplants and in shaded summer beds. Some are grown for their asymmetrical, patterned and variegated foliage, and others to add color to shady garden areas with their bright blooms.",
                    address: "5 place du Panthéon, Paris, France",
                    disponibility_start: DateTime.new(2020,5,1),
                    disponibility_end: DateTime.new(2020,8,4),
                    species: "begonia scharffii",
                    size: "Medium",
                    weight: "Light (0-2kg)",
                    indoor_outdoor: "Indoor/Outdoor")
begonia2.user = antoine
begonia2.photo.attach(io: begonia2_file, filename: 'begonia2.jpg', content_type: 'image/jpg')
begonia2.save!


lierre = Plant.new(name: "Ivy",
                    price: 3,
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
                    price: 2,
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

cactus = Plant.new(name: "Opunta Cactus",
                    price: 2,
                    comments: "The Opunta albispina cactus or angel wings cactus is a member of the prickly pear family that grows evenly spaced clusters of hairs rather than sharp spines. The Mexican native grows clusters of pads that get no larger than two feet tall but can grow up to five feet across over time. Pale yellow blooms are followed by red, edible fruits on plants that receive a full day of sun. ",
                    disponibility_start: DateTime.new(2020,4,7),
                    disponibility_end: DateTime.new(2020,8,5),
                    species: "Cactus",
                    address: "13 rue Gabriel Péri, 94700 Maisons-Alfort",
                    size: "Small",
                    weight: "Light (0-2kg)",
                    indoor_outdoor: "Indoor")
cactus.user = julien
cactus.photo.attach(io: cactus_file, filename: 'cactus.jpg', content_type: 'image/jpg')
cactus.save!

p "cactus created"

senecio = Plant.new(name: "senecio",
                    price: 10,
                    comments: "The senecio or angel wings senecio is a member of the prickly pear family that grows evenly spaced clusters of hairs rather than sharp spines. The Mexican native grows clusters of pads that get no larger than two feet tall but can grow up to five feet across over time. Pale yellow blooms are followed by red, edible fruits on plants that receive a full day of sun. ",
                    disponibility_start: DateTime.new(2020,4,7),
                    disponibility_end: DateTime.new(2020,8,5),
                    species: "senecio",
                    address: "Château de Versailles, Versailles, Île-de-France, France",
                    size: "Medium",
                    weight: "Medium (10-20kg)",
                    indoor_outdoor: "Indoor")
senecio.user = julien
senecio.photo.attach(io: senecio_file, filename: 'senecio.jpg', content_type: 'image/jpg')
senecio.save!

p "senecio created"


oak = Plant.new(name: "oak",
                    price: 10,
                    comments: "The oak or angel wings oak is a member of the prickly pear family that grows evenly spaced clusters of hairs rather than sharp spines. The Mexican native grows clusters of pads that get no larger than two feet tall but can grow up to five feet across over time. Pale yellow blooms are followed by red, edible fruits on plants that receive a full day of sun. ",
                    disponibility_start: DateTime.new(2020,4,7),
                    disponibility_end: DateTime.new(2020,8,5),
                    species: "oak",
                    address: "Zi Nord, 60130 Saint-Just-en-Chaussée",
                    size: "Large",
                    weight: "Large (150-200kg)",
                    indoor_outdoor: "Outdoor")
oak.user = julien
oak.photo.attach(io: oak_file, filename: 'oak.jpg', content_type: 'image/jpg')
oak.save!

p "oak created"
begonia3 = Plant.new(name: "Begonia flowers",
                    price: 3,
                    comments: "Very nice set of begonias for your balcony. Some are grown for their asymmetrical, patterned and variegated foliage, and others to add color to shady garden areas with their bright blooms.",
                    address: "5 rue Roger Duval, Le Havre, France",
                    disponibility_start: DateTime.new(2020,5,1),
                    disponibility_end: DateTime.new(2020,8,4),
                    species: "begonia scharffii",
                    size: "Medium",
                    weight: "Light (0-2kg)",
                    indoor_outdoor: "Indoor/Outdoor")
begonia3.user = antoine
begonia3.photo.attach(io: begonia3_file, filename: 'begonia3.jpg', content_type: 'image/jpg')
begonia3.save!

p "begonia3 created"

# --------------------------------------------------------------------------------------
# BOOKINGS
# --------------------------------------------------------------------------------------

p "generate seed bookings"

# --------------------------------------------------------------------------------------
# GERANIUM

booking_geranium1 = Booking.new(start_date: DateTime.new(2020,01,01),
                    end_date: DateTime.new(2020,01,07),
                    total_price: 5)
booking_geranium1.user = manu
booking_geranium1.plant = geranium
booking_geranium1.save!

p "booking_geranium1 created"

review_booking_geranium1 = Review.new(rating: 4, comments: "Good geranium, I strongly recommend!")
review_booking_geranium1.booking = booking_geranium1
review_booking_geranium1.save!

p "review_booking_geranium1 created"


# BEGONIA (1/2/3)
# ---------------------------------------------------------------

booking1_begonia = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking1_begonia.user = julien
booking1_begonia.plant = begonia
booking1_begonia.save!

p "booking_begonia1 created"

review_booking1_begonia = Review.new(rating: 5, comments: "Amazing begonias for the week, I strongly recommend!")
review_booking1_begonia.booking = booking1_begonia
review_booking1_begonia.save!

p "review_booking1_begonia created"


booking2_begonia = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking2_begonia.user = julien
booking2_begonia.plant = begonia
booking2_begonia.save!

p "booking_begonia2 created"

review_booking_begonia2 = Review.new(rating: 4, comments: "Nice plants")
review_booking_begonia2.booking = booking2_begonia
review_booking_begonia2.save!

p "review_booking_begonia2 created"

begonia3_begonia = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 8)
begonia3_begonia.user = laurent
begonia3_begonia.plant = begonia
begonia3_begonia.save!

p "begonia3_begonia created"

review_begonia3_begonia = Review.new(rating: 5, comments: "Very beautiful, was very nice on my balcony")
review_begonia3_begonia.booking = begonia3_begonia
review_begonia3_begonia.save!

p "review_begonia3_begonia created"


# BEGONIA2 (1/2)
# ---------------------------------------------------------------

booking1_begonia2 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking1_begonia2.user = julien
booking1_begonia2.plant = begonia2
booking1_begonia2.save!

p "booking1_begonia2 created"

review_booking1_begonia2 = Review.new(rating: 3, comments: "Nice begonias, but colors are not so vivid")
review_booking1_begonia2.booking = booking1_begonia2
review_booking1_begonia2.save!

p "review_booking1_begonia2 created"

booking2_begonia2 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking2_begonia2.user = julien
booking2_begonia2.plant = begonia2
booking2_begonia2.save!

p "booking2_begonia2 created"

review_booking2_begonia2 = Review.new(rating: 2, comments: "A bit disappointing, I expected more flowers")
review_booking2_begonia2.booking = booking2_begonia2
review_booking2_begonia2.save!

p "review_booking2_begonia2 created"



# -----------------------------------------------------------------------
# ROSE 1 & 2

booking1_rose = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking1_rose.user = laurent
booking1_rose.plant = rose
booking1_rose.save!

p "booking1_rose created"


review_booking1_rose = Review.new(rating: 4, comments: "Very nice roses, thank you!")
review_booking1_rose.booking = booking1_rose
review_booking1_rose.save!

p "review_booking1_rose created"

booking2_rose = Booking.new(start_date: DateTime.new(2020,01,01),
                    end_date: DateTime.new(2020,02,01),
                    total_price: 10)
booking2_rose.user = laurent
booking2_rose.plant = rose
booking2_rose.save!

p "booking2_rose created"

review_booking2_rose = Review.new(rating: 5, comments: "Amazing roses, definitely recommend!")
review_booking2_rose.booking = booking2_rose
review_booking2_rose.save!

p "review_booking2_rose created"


# -----------------------------------------------------------------------
# TULIPE1

booking1_tulipe = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking1_tulipe.user = julien
booking1_tulipe.plant = tulipe
booking1_tulipe.save!

p "booking1_tulipe created"

review_booking1_tulipe = Review.new(rating: 1, comments: "Owner didn't come to meeting point")
review_booking1_tulipe.booking = booking1_tulipe
review_booking1_tulipe.save!

p "review_booking_tulipe1 created"

# -----------------------------------------------------------------------
# TULIPE2

booking2_tulipe = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking2_tulipe.user = julien
booking2_tulipe.plant = tulipe
booking2_tulipe.save!

p "booking2_tulipe created"

review_booking_tulipe2 = Review.new(rating: 3, comments: "Nice flowers but owner hard to reach")
review_booking_tulipe2.booking = booking2_tulipe
review_booking_tulipe2.save!

p "review_booking_tulipe2 created"

# -----------------------------------------------------------------------
# TULIPE3

booking3_tulipe = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking3_tulipe.user = antoine
booking3_tulipe.plant = tulipe
booking3_tulipe.save!

p "booking_tulipe3 created"


review_booking_tulipe3 = Review.new(rating: 4, comments: "Very nice tulipes, thank you!")
review_booking_tulipe3.booking = booking3_tulipe
review_booking_tulipe3.save!

p "review_booking_tulipe3 created"


# ---------------------------------------------------------------
# LIERRE

booking1_lierre = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking1_lierre.user = julien
booking1_lierre.plant = lierre
booking1_lierre.save!

p "booking1_lierre created"

review_booking1_lierre = Review.new(rating: 4, comments: "Nice lierre, but colors are not so vivid")
review_booking1_lierre.booking = booking1_lierre
review_booking1_lierre.save!

p "review_booking1_lierre created"



# ---------------------------------------------------------------
# FICUS

booking1_ficus = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking1_ficus.user = julien
booking1_ficus.plant = ficus
booking1_ficus.save!

p "booking1_ficus created"

review_booking1_ficus = Review.new(rating: 5, comments: "Nice ficus, but colors are not so vivid")
review_booking1_ficus.booking = booking1_ficus
review_booking1_ficus.save!

p "review_booking1_ficus created"


# ---------------------------------------------------------------
# PILEA (1,2,3)

booking1_pilea = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking1_pilea.user = julien
booking1_pilea.plant = pilea
booking1_pilea.save!

p "booking1_pilea created"

review_booking1_pilea = Review.new(rating: 5, comments: "Nice pilea, but colors are not so vivid")
review_booking1_pilea.booking = booking1_pilea
review_booking1_pilea.save!

p "review_booking1_pilea created"


booking2_pilea = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking2_pilea.user = laurent
booking2_pilea.plant = pilea
booking2_pilea.save!

p "booking2_pilea created"

review_booking2_pilea = Review.new(rating: 4, comments: "Very cool pilea, but colors are not so vivid")
review_booking2_pilea.booking = booking2_pilea
review_booking2_pilea.save!

p "review_booking2_pilea created"

booking3_pilea = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking3_pilea.user = laurent
booking3_pilea.plant = pilea
booking3_pilea.save!

p "booking3_pilea created"

review_booking3_pilea = Review.new(rating: 4, comments: "Amazing pilea!")
review_booking3_pilea.booking = booking3_pilea
review_booking3_pilea.save!

p "review_booking3_pilea created"




# ---------------------------------------------------------------
# MONSTERA (1,2)

booking1_monstera = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking1_monstera.user = julien
booking1_monstera.plant = monstera
booking1_monstera.save!

p "booking1_monstera created"

review_booking1_monstera = Review.new(rating: 5, comments: "Nice monstera, I love it!")
review_booking1_monstera.booking = booking1_monstera
review_booking1_monstera.save!

p "review_booking1_monstera created"


booking2_monstera = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking2_monstera.user = julien
booking2_monstera.plant = monstera
booking2_monstera.save!

p "booking2_monstera created"

review_booking2_monstera = Review.new(rating: 4, comments: "Cool monstera, I strongly recommend!")
review_booking2_monstera.booking = booking2_monstera
review_booking2_monstera.save!

p "review_booking2_monstera created"


# ---------------------------------------------------------------
# BEGONIA3 (1,2)

booking1_begonia3 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking1_begonia3.user = julien
booking1_begonia3.plant = begonia3
booking1_begonia3.save!

p "booking1_begonia3 created"

review_booking1_begonia3 = Review.new(rating: 5, comments: "Nice begonia3, I love it!")
review_booking1_begonia3.booking = booking1_begonia3
review_booking1_begonia3.save!

p "review_booking1_begonia3 created"

booking2_begonia3 = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking2_begonia3.user = julien
booking2_begonia3.plant = begonia3
booking2_begonia3.save!

p "booking2_begonia3 created"

review_booking2_begonia3 = Review.new(rating: 4, comments: "Very cool begonia, I definitely recommend!")
review_booking2_begonia3.booking = booking2_begonia3
review_booking2_begonia3.save!

p "review_booking2_begonia3 created"



# ---------------------------------------------------------------
# FIR

booking1_sapin = Booking.new(start_date: DateTime.now,
                    end_date: DateTime.now,
                    total_price: 10)
booking1_sapin.user = julien
booking1_sapin.plant = sapin
booking1_sapin.save!

p "booking1_sapin created"

review_booking1_sapin = Review.new(rating: 5, comments: "Nice sapin, perfect for Christmas!")
review_booking1_sapin.booking = booking1_sapin
review_booking1_sapin.save!



